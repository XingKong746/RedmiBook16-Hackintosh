// SSDT-EC
// SSDT-USBX
DefinitionBlock ("", "SSDT", 2, "XK746 ", "EcUsbx", 0x00001000) {
    External (\_SB.PCI0.LPCB, DeviceObj)

    Scope (\_SB.PCI0.LPCB) {
        Device (EC) {
            Name (_HID, "ACID0001")  // _HID: Hardware ID

            Method (_STA, 0, NotSerialized) { // _STA: Status
                If (_OSI ("Darwin")) {
                    Return (0x0F)
                }
                Else {
                    Return (Zero)
                }
            }
        }
    }

//--------------------------------------------------//

    Scope (\_SB) {
        Device (USBX) {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized) { // _DSM: Device-Specific Method
                If (LNot (Arg2)) {
                    Return (Buffer () {
                        0x03
                    })
                }
                Return (Package () {
                    "kUSBSleepPowerSupply",
                    0x13EC,
                    "kUSBSleepPortCurrentLimit",
                    0x0834,
                    "kUSBWakePowerSupply",
                    0x13EC,
                    "kUSBWakePortCurrentLimit",
                    0x0834
                })
            }
            Method (_STA, 0, NotSerialized) { // _STA: Status
                If (_OSI ("Darwin")) {
                    Return (0x0F)
                }
                Else {
                    Return (Zero)
                }
            }
        }
    }
}
