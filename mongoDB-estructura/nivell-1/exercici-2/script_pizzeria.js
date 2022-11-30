use pizzeria
db.botigues.drop()
db.botigues.insertMany([
{
    id_botiga:1,
    adreça:{
        carrer:"Plaça Jordi, 85, 2º E",
        codi_postal:"94875",
        localitat:"Ulla",
        provincia:"Cantabria"
        },
    empleats: [
        {
            id_empleat:1,
            nom:"Ane",
            cognoms:"Almaráz Rodríguez",
            nif:"16598099B",
            telefon:"600331096",
            carrec:"cuiner"
        },
        {
        id_empleat:2,
        nom:"Unax",
        cognoms:"Pina Saiz",
        nif:"10338844E",
        telefon:"661340937",
        carrec:"repartidor"
        }
    ],
    clients: {
        id_client:1,
        nom:"Helena",
        cognoms:"Armijo Garica",
        adreça: {
            carrer:"C/ Rayan, 81, 03º F",
            codi_postal:"86852",
            localitat:"San Peláez",
            provincia:"Toledo"
        },
        telefon:"628252031",
        comandes: {
            id_comanda:1,
            data_comanda:new Date("2021-11-26T19:27:48Z"),
            recollida: {
                tipus:"domicili",
                repartidor:"Unax Pina Saiz'",
                hora:new Date("2021-11-26T20:03:48Z")
            },
            productes: {
                pizzes: 
                {
                    id_producte:1,
                    nom:"Prosciutto",
                    descripcio:"Mozzarela, jamón y queso",
                    imatge:"",
                    preu:9.99,
                    categoria: {
                        id_categoria:1,
                        nom:"clásicas"
                    },
                quantitat:1       
                },
                hamburgueses:
                {
                    id_producte:3,
                    nom:"Completa",
                    descripcio:"Hamburguesa, lechuga, tomate, queso y bacon",
                    imatge:"",
                    preu:5.99,
                    quantitat:1
                },
                begudes: 
                {
                    id_producte:5,
                    nom:"Cocacola",
                    descripcio:"Cocacola clásica",
                    imatge:"",
                    preu:1.99,
                    quantitat:2
                }
            },
            preu_total:19.96,
        }
    }
},
{
    id_botiga:2,
    adreça:{
        carrer:"Travesía Laia, 13, 8º A",
        codi_postal:"62312",
        localitat:"Ozuna",
        provincia:"Lugo"
    },
    empleats: [
        {
            id_empleat:1,
            nom:"Tomas",
            cognoms:"Redondo Figueroa",
            nif:"10083265L",
            telefon:"691114260",
            carrec:"cuiner"
        },
        {
            id_empleat:2,
            nom:"Purificacion",
            cognoms:"Fraile Toribio",
            nif:"31066883R",
            telefon:"640570604",
            carrec:"repartidor"
        }],
    clients: {
        id_client:2,
        nom:"'Óscar",
        cognoms:"Heredia Barroso",
        adreça: {
            carrer:"Carrer Montes, 904, Bajo 6º",
            codi_postal:"35635",
            localitat:"San Santacruz del Barco",
            provincia:"Cádiz"
        },
        telefon:"699621916",
        comandes: [
        {
            id_comanda:2,
            data_comanda:new Date("2021-11-30T21:51:12Z"),
            recollida: {
                tipus:"botiga",
            },
            productes: {
                pizzes: [
                {
                    id_producte:1,
                    nom:"Prosciutto",
                    descripcio:"Mozzarela, jamón y queso",
                    imatge:"",
                    preu:9.99,
                    categoria: {
                        id_categoria:1,
                        nom:"clásicas"
                    },
                    quantitat:2       
                },
                {
                    id_producte:2,
                    nom:"Tropical",
                    descripcio:"Mozzarela, jamón y piña",
                    imatge:"",
                    preu:9.99,
                    categoria: {
                        id_categoria:2,
                        nom:"verano"
                    },
                    quantitat:1
                }],
                begudes: {
                    id_producte:5,
                    nom:"Cocacola",
                    descripcio:"Cocacola clásica",
                    imatge:"",
                    preu:1.99,
                    quantitat:1
                }
            },
            preu_total:31.96,
        },
        {
            id_comanda:3,
            data_comanda:new Date("2021-11-30T21:51:12Z"),
            recollida: {
                tipus:"botiga",
            },
            productes: {
                hamburgueses: {
                    id_producte:3,
                    nom:"Completa",
                    descripcio:"Hamburguesa, lechuga, tomate, queso y bacon",
                    imatge:"",
                    preu:5.99,
                    quantitat:2 
                },
                begudes: [
                    {
                        id_producte:6,
                        nom:"Nestea",
                        descripcio:"Nestea sabor limón",
                        imatge:"",
                        preu:1.99,
                        quantitat:1
                    },
                    {
                        id_producte:5,
                        nom:"Cocacola",
                        descripcio:"Cocacola clásica",
                        imatge:"",
                        preu:1.99,
                        quantitat:1
                    }
                ]
            
            },
            preu_total:15.96,
        }]
    }
}])