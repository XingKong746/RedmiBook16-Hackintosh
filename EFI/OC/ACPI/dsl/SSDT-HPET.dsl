//
// Supplementary HPET _CRS from Goldfish64
// Requires at least the HPET's _CRS to XCRS rename
//
DefinitionBlock ("", "SSDT", 2, "XK746", "Hpet", 0x00000000) {
    External (\_SB.PCI0.LPCB.HPET, DeviceObj)
    External (\_SB.PCI0.LPCB.HPET.XCRS, MethodObj)
    External (\_SB.PCI0.LPCB.HPET.XSTA, MethodObj)

    Scope (\_SB.PCI0.LPCB.HPET) {
        Name (
            BUFX,
            ResourceTemplate () {
                // Only choose 0, and 8 to mimic a real mac's DSDT.
                // You may optionally want to add 11 and/or 12 here if
                // it does not work as expected - though those may have
                // other side effects (broken trackpad or otherwise).
                IRQNoFlags () { 0,8 }

                // AccessType/Base/Length pulled from DSDT
                Memory32Fixed (ReadWrite, // Access Type
                    0xFED00000,           // Address Base
                    0x00000400,           // Address Length
                )
            }
        )

        Method (_CRS, 0, Serialized) { // _CRS: Current Resource Settings
            // Return our buffer if booting macOS or the XCRS method
            // no longer exists for some reason
            If (LOr (_OSI ("Darwin"), LNot(CondRefOf (\_SB.PCI0.LPCB.HPET.XCRS)))) {
                Return (BUFX)
            }

            // Not macOS and XCRS exists - return its result
            Return (\_SB.PCI0.LPCB.HPET.XCRS ())
        }
        Method (_STA, 0, NotSerialized) { // _STA: Status
            // Return 0x0F if booting macOS or the XSTA method
            // no longer exists for some reason
            If (LOr (_OSI ("Darwin"), LNot (CondRefOf (\_SB.PCI0.LPCB.HPET.XSTA)))) {
                Return (0x0F)
            }

            // Not macOS and XSTA exists - return its result
            Return (\_SB.PCI0.LPCB.HPET.XSTA ())
        }
    }
}
