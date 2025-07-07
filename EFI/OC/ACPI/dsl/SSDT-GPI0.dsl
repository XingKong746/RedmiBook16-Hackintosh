// Source: https://github.com/daliansky/OC-little
DefinitionBlock("", "SSDT", 2, "DRTNIA", "GPI0", 0)
{
    External(GPHD, FieldUnitObj)
    
    If (_OSI("Darwin"))
    {
        GPHD = Zero
    }
}
