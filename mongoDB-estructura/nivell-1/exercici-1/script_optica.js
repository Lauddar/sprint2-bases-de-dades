use optica
db.clients.drop()
db.clients.insertMany([{
	client_id: 1,
    nom: "Elsa Sosa",
	adreça_postal: {
		carrer: "Avenida Victoria",
		numero: "40",
		pis: "Bajos",
		localitat: "Los Mateo de las Torres",
		codi_postal: "04661",
		pais: "España"
	},
    telefon: "690538135",
    correu_electronic: "marco25@rendon.com",
    data_registre: new Date("2019-06-29T12:52:14Z")
},

{
	client_id: 2,
	nom: "Claudia Lorente",
	adreça_postal: {
		carrer: "Avenida Ángel",
		numero: "136",
		pis: "9º",
        porta: "A",
		localitat: "As Martos",
		codi_postal: "64636",
		pais: "España"
	},
    telefon: "651706084",
    correu_electronic: "bruno25@carranza.com",
    data_registre: new Date("2020-03-09T13:13:36Z"),
    compres: [
        {
            ulleres: {
                marca: "Ray ban",
                vidre: {
                    dret: {
                        graduació: 1.25,
                        color: "transparent"
                    },
                    esquerra: {
                        graduació: 1.5,
                        color: "transparent"
                    }
                },
                muntura: {
                    tipus: "METAL·LICA",
                    color: "negre"
                },
                preu: 159.99,
                proveidor: {
                    nom: "Veo veo",
                    adreça_postal: {
                        carrer: "Calle Iria",
                        numero: "91",
                        pis: "2",
                        porta: "A",
                        localitat: "Godoy",
                        codi_postal: "74025",
                        pais: "España"
                    },
                    telefon: "694544929",
                    fax: "984544929",
                    nif: "B51323806"
                }
            },
            venedor: "Rafael Ortiz",
            data_venda: new Date("2021-12-11T17:17:16Z")
        },
        {
            ulleres: {
                marca: "Oakley",
                vidre: {
                    dret: {
                        graduació: 3.5,
                        color: "transparent"
                    },
                    esquerra: {
                        graduació: 3.5,
                        color: "transparent"
                    }
                },
                muntura: {
                    tipus: "PASTA",
                    color: "blau"
                },
                preu: 139.99,
                proveidor: {
                    nom: "Graduados",
                    adreça_postal: {
                        carrer: "Plaza Fonseca",
                        numero: "20",
                        pis: "1º",
                        porta: "D",
                        localitat: "Villa Hernando",
                        codi_postal: "02174",
                        pais: "España"
                    },
                    telefon: "678123456",
                    fax: "978123456",
                    nif: "R0281031E"
                }
            },
            venedor: "Anabel Castillo",
            data_venda: new Date("2022-10-10T14:38:12Z") 
        }
    ],
    recomanat_per: "Elsa Sosa"
},

{
	client_id: 3,
	nom: "Miguel Ángel Correa Segundo",
	adreça_postal: {
		carrer: "Rúa Delacrúz",
		numero: "3",
		pis: "3º",
		localitat: "Os Farías del Puerto",
		codi_postal: "33918",
		pais: "España"
	},
    telefon: "613322068",
    correu_electronic: "aponte.leo@latinmail.com",
    data_registre: new Date("2019-12-26T11:17:42Z"),
    compres: {
        ulleres: {
            marca: "Hawkers",
            vidre: {
                dret: {
                    graduació: 0,
                    color: "transparent"
                },
                esquerra: {
                    graduació: 0,
                    color: "transparent"
                }
            },
            muntura: {
                tipus: "FLOTANT",
                color: "negre"
            },
            preu: 129.99,
            proveidor: {
                nom: "Top ulleres",
                adreça_postal: {
                    carrer: "Carrer Valles",
                    numero: "5",
                    localitat: "Vall Luevano del Puerto",
                    codi_postal: "54019",
                    pais: "España"
                },
            telefon: "603136122",
            fax: "703136122",
            nif: "16595778J"
            }
        },
        venedor: "Sandra Pinto",
        data_venda: ISODate("2022-11-18T17:52:40Z")
    },
    recomanat_per: "Claudia Lorente"
}])