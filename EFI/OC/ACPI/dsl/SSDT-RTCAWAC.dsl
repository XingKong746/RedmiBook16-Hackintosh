DefinitionBlock ("", "SSDT", 2, "XK746", "RTCAWAC", 0x00000000) {
    External (STAS, IntObj)

    Scope (\) {
        Method (_INI, 0, NotSerialized) { // _INI: Initialize
            If (_OSI ("Darwin")) {
                Store (One, STAS)
            }
        }
    }
}
