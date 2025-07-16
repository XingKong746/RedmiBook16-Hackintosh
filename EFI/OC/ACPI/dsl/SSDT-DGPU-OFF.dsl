// SSDT-dGPU-Off
// SSDT-NoHybGfx
DefinitionBlock ("", "SSDT", 2, "XK746", "dGpuOff", 0x00000000) {
    External (\_SB.PCI0.RP13.PXSX._OFF, MethodObj) // ACPI Path of dGPU

    Device(RMD1) {
        Name(_HID, "RMD10000") // _HID: Hardware ID

        Method (_STA, 0, NotSerialized) { // _STA: Status
            If (_OSI ("Darwin")) {
                Return (0x0F)
            }
            Else {
                Return (Zero)
            }
        }

        Method(_INI) {
            If (_OSI ("Darwin")) {
                // disable discrete graphics (Nvidia/Radeon) if it is present
                If (CondRefOf(\_SB.PCI0.RP13.PXSX._OFF)) {
                    \_SB.PCI0.RP13.PXSX._OFF()
                }
            }
            Else {}
        }
    }

//--------------------------------------------------//

    External (\_SB.PCI0.RP13.PXSX._DSM, MethodObj) // dGPU ACPI Path
    External (\_SB.PCI0.RP13.PXSX._PS3, MethodObj) // dGPU ACPI Path

    Device (NHG1) {
        Name (_HID, "NHG10000")  // _HID: Hardware ID

        Method (_STA, 0, NotSerialized) { // _STA: Status
            If (_OSI ("Darwin")) {
                Return (0x0F)
            }
            Else {
                Return (Zero)
            }
        }

        Method (_INI, 0, NotSerialized) { // _INI: Initialize
            If (_OSI ("Darwin")) {
                // If conditional methods reference creation successful
                If ((CondRefOf (\_SB.PCI0.RP13.PXSX._DSM) && CondRefOf (\_SB.PCI0.RP13.PXSX._PS3))) {
                    // Card Off Request
                    \_SB.PCI0.RP13.PXSX._DSM (
                        ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"),
                        0x0100,
                        0x1A,
                        Buffer (0x04) { 0x01, 0x00, 0x00, 0x03 }
                    )
                    // Card Off
                    \_SB.PCI0.RP13.PXSX._PS3 ()
                }
            }
            Else {}
        }
    }
}
