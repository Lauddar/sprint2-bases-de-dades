use pizzeria
db.dropDatabase()
db.botigues.insertMany([
    {
        _id:ObjectId("63947b7d95b958422c5e6d0e"),
        adreça:{
            carrer:"Plaça Jordi, 85, 2º E",
            codi_postal:"94875",
            localitat:"Ulla",
            provincia:"Cantabria"
            }
    },
    {
        _id: ObjectId("63947ddcb7e705070f35bdd3"),
        adreça:{
            carrer:"Travesía Laia, 13, 8º A",
            codi_postal:"62312",
            localitat:"Ozuna",
            provincia:"Lugo"
        }
    }
])
db.empleats.insertMany([
        {
            _id: ObjectId("63947c11c0e5db89fc2b39fe"),
            nom:"Ane",
            cognoms:"Almaráz Rodríguez",
            nif:"16598099B",
            telefon:"600331096",
            carrec:"cuiner",
            botiga: ObjectId("63947b7d95b958422c5e6d0e")
        },
        {
            _id: ObjectId("63947c21d237b47a3e66ed9c"),
            nom:"Unax",
            cognoms:"Pina Saiz",
            nif:"10338844E",
            telefon:"661340937",
            carrec:"repartidor",
            botiga: ObjectId("63947b7d95b958422c5e6d0e")
        },
        {
            _id: ObjectId("63947d6b97f9c3e18ac0064b"),
            nom:"Tomas",
            cognoms:"Redondo Figueroa",
            nif:"10083265L",
            telefon:"691114260",
            carrec:"cuiner",
            botiga: ObjectId("63947ddcb7e705070f35bdd3")
        },
        {
            _id: ObjectId("63947d71b6f48cdede1f6486"),
            nom:"Purificacion",
            cognoms:"Fraile Toribio",
            nif:"31066883R",
            telefon:"640570604",
            carrec:"repartidor",
            botiga: ObjectId("63947ddcb7e705070f35bdd3")
        }
])
db.clients.insertMany([
    {
        _id: ObjectId("6394823c07126d3e872f741c"),
        nom:"Helena",
        cognoms:"Armijo Garica",
        adreça: {
            carrer:"C/ Rayan, 81, 03º F",
            codi_postal:"86852",
            localitat:"San Peláez",
            provincia:"Toledo"
        },
        telefon:"628252031"
    },
    {
        _id: ObjectId("639482795a375fba24a43859"),
        nom:"Óscar",
        cognoms:"Heredia Barroso",
        adreça: {
            carrer:"Carrer Montes, 904, Bajo 6º",
            codi_postal:"35635",
            localitat:"San Santacruz del Barco",
            provincia:"Cádiz"
        },
        telefon:"699621916"
    }
])
db.productes.insertMany([
    {
        _id: ObjectId("639484482f88d53aae225fde"),
        nom:"Prosciutto",
        descripcio:"Mozzarella, jamón y queso",
        tipus:"pizza",
        imatge:"prosciutto.jpg",
        preu:9.99,
        categoria: ObjectId("6394cb973edc49bd0d1a9f70")
    },
    {
        _id: ObjectId("6394846a71ccbcff9ad2e3db"),
        nom:"Tropical",
        descripcio:"Mozzarella, jamón y piña",
        tipus:"pizza",
        imatge:"tropical.jpg",
        preu:9.99,
        categoria: ObjectId("6394cbd35c421972c104ad6e")
    },
    {
        _id: ObjectId("6394847aedc7757547fdf02d"),
        nom:"Completa",
        descripcio:"Hamburguesa, lechuga, tomate, queso y bacon",
        tipus:"hamburguesa",
        imatge:"completa.jpg",
        preu:5.99
    },
    {
        _id: ObjectId("6394848166e8f2da3791d706"),
        nom:"Cocacola",
        descripcio:"Cocacola clásica",
        tipus:"beguda",
        imatge:"cocacola.jpg",
        preu:1.99,
    },
    {
        _id: ObjectId("639484853627f02d361d8a30"),
        nom:"Nestea",
        descripcio:"Nestea sabor limón",
        tipus:"beguda",
        imatge:"nestea.jpg",
        preu:1.99,
    }
])
db.comandes.insertMany([
    {
        _id: ObjectId("6394d11e2fdbab357837bcdc"),
        client: ObjectId("6394823c07126d3e872f741c"),
        botiga: ObjectId("63947b7d95b958422c5e6d0e"),
        data_comanda: ISODate("2021-11-26T19:27:48Z"),
        recollida: {
            tipus: "domicili",
            repartidor: ObjectId("63947c21d237b47a3e66ed9c"),
            hora: ISODate("2021-11-26T20:03:48Z")
        },
        productes: {
            pizzes: {
                pizza: ObjectId("639484482f88d53aae225fde"),
                quantitat:1 
            },
            hamburgueses: {
                hamburguesa: ObjectId("6394847aedc7757547fdf02d"),
                quantitat:1 
            },
            begudes: {
                begudes: ObjectId("6394848166e8f2da3791d706"),
                quantitat:2 
            },
    
        },
        preu_total:19.96,
    },
    {
        _id: ObjectId("6394d177e3b7c1314672bf80"),
        client: ObjectId("639482795a375fba24a43859"),
        botiga: ObjectId("63947ddcb7e705070f35bdd3"),
        data_comanda:ISODate("2021-11-30T21:51:12Z"),
        recollida: {
            tipus:"botiga"
        },
        productes: {
            pizzes: [
            {
                pizza: ObjectId("639484482f88d53aae225fde"),
                quantitat:2
            },
            {
                pizza: ObjectId("6394846a71ccbcff9ad2e3db"),
                quantitat:1
            }],
            begudes: {
                beguda: ObjectId("6394848166e8f2da3791d706"),
                quantitat:1
            },
        },
        preu_total:31.96
    },
    {
        _id: ObjectId("6394d171f8efb0213e8b6148"),
        client: ObjectId("639482795a375fba24a43859"),
        botiga: ObjectId("63947ddcb7e705070f35bdd3"),
        data_comanda:ISODate("2021-11-30T21:51:12Z"),
        recollida: {
            tipus:"botiga"
        },
        productes: {
            hamburgueses: {
                hamburguesa:ObjectId("6394847aedc7757547fdf02d"),
                quantitat:2 
            },
            begudes: [
            {
                beguda: ObjectId("6394848166e8f2da3791d706"),
                quantitat:1
            },
            {
                beguda:  ObjectId("639484853627f02d361d8a30"),
                quantitat:1
            }]
        },
        preu_total:15.96
    }
])
db.categories.insertMany([
    {
        _id: ObjectId("6394cb973edc49bd0d1a9f70"),
        nom: "clásica"
    },
    {
        _id: ObjectId("6394cbd35c421972c104ad6e"),
        nom: "verano"
    }
])

