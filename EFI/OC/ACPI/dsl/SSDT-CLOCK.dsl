// SSDT-RTCAWAC
// SSDT-RTC0-RANGE
DefinitionBlock ("", "SSDT", 2, "XK746", "CLOCK", 0x00000000) {
    External (STAS, IntObj)

    Scope (\) {
        Method (_INI, 0, NotSerialized) { // _INI: Initialize
            If (_OSI ("Darwin")) {
                Store (One, STAS)
            }
        }
    }

//--------------------------------------------------------//

    External (\_SB.PCI0.LPCB, DeviceObj)
    External (\_SB.PCI0.LPCB.RTC_, DeviceObj)

    Scope (\_SB.PCI0.LPCB) {
        Scope (RTC) {
            Method (_STA, 0, NotSerialized) { // _STA: Status
                If (_OSI ("Darwin")) {
                    Return (Zero)
                } Else {
                    Return (0x0F)
                }
            }
        }

        Device (RTC0) {
            Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
            Name (
                _CRS, 
                ResourceTemplate () { // _CRS: Current Resource Settings
                    IO (
                        Decode16,
                        0x0070,             // Range Minimum 1
                        0x0070,             // Range Maximum 1
                        0x01,               // Alignment 1
                        0x04,               // Length 1      (Expanded to include 0x72 and 0x73)
                    )

                    IO (
                        Decode16,
                        0x0074,             // Range Minimum 2
                        0x0074,             // Range Maximum 2
                        0x01,               // Alignment 2
                        0x04,               // Length 2
                    )

                    IRQNoFlags () {
                        8
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
