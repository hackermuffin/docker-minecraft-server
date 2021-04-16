events.listen('recipes', (event) => {
    var data = {
        recipes: [
            {
                type: 'pneumaticcraft:thermo_plant',
                fluid_input: { type: 'pneumaticcraft:fluid', fluid: 'industrialforegoing:essence', amount: 1000 },
                fluid_output: { fluid: 'pneumaticcraft:memory_essence', amount: 1000 },
                pressure: 1.0,
                exothermic: false
            },
            {
                type: 'pneumaticcraft:thermo_plant',
                item_input: { tag: 'integrateddynamics:menril_logs' },
                item_output: { item: 'integrateddynamics:crystalized_menril_chunk', count: 4 },
                fluid_output: { fluid: 'integrateddynamics:menril_resin', amount: 1000 },
                pressure: 3.0,
                exothermic: false
            },
            {
                type: 'pneumaticcraft:thermo_plant',
                item_input: { item: 'integrateddynamics:menril_planks' },
                item_output: { item: 'integrateddynamics:crystalized_menril_chunk' },
                fluid_output: { fluid: 'integrateddynamics:menril_resin', amount: 250 },
                pressure: 3.0,
                exothermic: false
            },
            {
                type: 'pneumaticcraft:thermo_plant',
                item_input: { item: 'minecraft:popped_chorus_fruit' },
                item_output: { item: 'integrateddynamics:crystalized_chorus_chunk', count: 4 },
                fluid_output: { fluid: 'integrateddynamics:liquid_chorus', amount: 125 },
                pressure: 3.0,
                exothermic: false
            },
            {
                type: 'pneumaticcraft:thermo_plant',
                item_input: { item: 'integrateddynamics:proto_chorus' },
                item_output: { item: 'integrateddynamics:crystalized_chorus_chunk', count: 2 },
                fluid_output: { fluid: 'integrateddynamics:liquid_chorus', amount: 125 },
                pressure: 3.0,
                exothermic: false
            },
            {
                type: 'pneumaticcraft:thermo_plant',
                item_input: { tag: 'forge:glass/colorless' },
                item_output: { item: 'integratedterminals:menril_glass' },
                fluid_input: { type: 'pneumaticcraft:fluid', fluid: 'integrateddynamics:menril_resin', amount: 1000 },
                pressure: 3.0,
                exothermic: false,
                temperature: { min_temp: 1273 }
            },
            {
                type: 'pneumaticcraft:thermo_plant',
                item_input: { tag: 'forge:glass/colorless' },
                item_output: { item: 'integratedterminals:chorus_glass' },
                fluid_input: { type: 'pneumaticcraft:fluid', fluid: 'integrateddynamics:liquid_chorus', amount: 1000 },
                pressure: 3.0,
                exothermic: false,
                temperature: { min_temp: 1273 }
            }
        ]
    };

    data.recipes.forEach((recipe) => {
        event.custom(recipe);
    });
});
