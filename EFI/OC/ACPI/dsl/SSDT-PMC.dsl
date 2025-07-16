DefinitionBlock ("", "SSDT", 2, "XK746", "Pmcr", 0x00001000) {
    External (\_SB.PCI0.LPCB, DeviceObj)

    Scope (\_SB.PCI0.LPCB) {
        Device (PMCR) {
            Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate () { // _CRS: Current Resource Settings
                    Memory32Fixed (
                        ReadWrite,
                        0xFE000000,         // Address Base
                        0x00010000,         // Address Length
                    )
                }
            )

            Method (_STA, 0, NotSerialized) { // _STA: Status
                If (_OSI ("Darwin")) {
                    Return (0x0B)
                }
                Else {
                    Return (Zero)
                }
            }
        }
    }
}
