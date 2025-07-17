DefinitionBlock ("", "SSDT", 2, "XK746", "ALS0", 0x00000000) {
    Scope (\_SB) {
        Device (ALS0) {
            Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
            Name (_CID, "smc-als")  // _CID: Compatible ID
            Name (_ALI, 0x012C)  // _ALI: Ambient Light Illuminance
            Name (
                _ALR, // _ALR: Ambient Light Response
                Package (0x01) {
                    Package (0x02) {
                        0x64,
                        0x012C
                    }
                }
            )

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
