DefinitionBlock ("", "SSDT", 2, "XK746", "SBUSMCHC", 0x00000000) {
    External (\_SB.PCI0, DeviceObj)
    External (\_SB.PCI0.MCHC, DeviceObj)
    External (\_SB.PCI0.SBUS, DeviceObj)

    // Only create MCHC if it doesn't already exist
    If (LNot (CondRefOf (\_SB.PCI0.MCHC))) {
        Scope (\_SB.PCI0) {
            Device (MCHC) {
                Name (_ADR, Zero)  // _ADR: Address

                Method (_STA, 0, NotSerialized) { // _STA: Status
                    If (_OSI ("Darwin")) {
                        Return (0x0F)
                    } Else {
                        Return (Zero)
                    }
                }
            }
        }
    }

    Device (\_SB.PCI0.SBUS.BUS0) {
        Name (_CID, "smbus")  // _CID: Compatible ID
        Name (_ADR, Zero)  // _ADR: Address

        Method (_STA, 0, NotSerialized) { // _STA: Status
            If (_OSI ("Darwin")) {
                Return (0x0F)
            } Else {
                Return (Zero)
            }
        }
    }
}
