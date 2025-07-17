// SSDT-XOSI
// SSDT-GPI0
DefinitionBlock ("", "SSDT", 2, "XK746", "I2cHid", 0x00001000) {
    Method (XOSI, 1, NotSerialized) {
        Store (
            Package () {
                "Windows 2001", // Windows XP
                "Windows 2001 SP1", // Windows XP SP1
                "Windows 2001 SP2", // Windows XP SP2
                "Windows 2001.1", // Windows Server 2003
                "Windows 2006", // Windows Vista
                "Windows 2009", // Windows 7, Win Server 2008 R2
                "Windows 2012", // Windows 8, Win Server 2012
                "Windows 2013", // Windows 8.1
                "Windows 2015" // Windows 10
            },
            Local0
        )

        If (_OSI ("Darwin")) {
            Return (
                LNotEqual (
                    Match (Local0, MEQ, Arg0, MTR, Zero, Zero),
                    Ones
                )
            )
        } Else {
            Return (_OSI (Arg0))
        }
    }

//--------------------------------------------------------//

    External(\GPHD, FieldUnitObj)

    If (_OSI("Darwin")) {
        \GPHD = Zero
    }
}
