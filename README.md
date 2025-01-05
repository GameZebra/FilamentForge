# FilamentForge
A machine that recycles PET bottles into filament for 3d printing.
Everything you'll need.

# FIle organization:
* Hardware:
    * Parts:
        * includes a list of all electrical components used
    * 3D models:
        * Containing all the 3d printed parts, model of the complete assembly and building instructions
* system_control:
    * system_identification
        * instructions how to make matematical models of your particular parts
        * MatLab example codes for my version
    * regulators:
        * using the models form the identification step to tune well the regulators
        * again with MatLab example codes
* stm32_code:
    * test_regulator_
        * containing the software implementation for the proposed regulators (used like Unit testing)
    * FilamentForge_complete
        * where all the components are combined



