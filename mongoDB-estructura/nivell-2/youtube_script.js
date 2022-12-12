use youtube
db.dropDatabase()
db.users.insertMany([
    {
        _id: ObjectId("6394ff6f7124c6a306f58e9d"),
        email:"dottie@email.com",
        password:"12345",
        user_name:"MrDot",
        birth:new Date('1998-07-19T'),
        gender:"other",
        country:"Spain",
        postal_code:"05746",
        subscriptions: [ObjectId("63950374f30cb3230e18a0dd")]
    },
    {
        _id: ObjectId("6394ff994fb825d318befae5"),
        email:"lil.mile@email.com",
        password:"abcde",
        user_name:"Lil mile",
        birth:new Date('1986-07-19T'),
        gender:"female",
        country:"Spain",
        postal_code:"02359",
        subscriptions: [ObjectId("6395029db784244315bb574a")],
    },
    {
        _id: ObjectId("6394ff9d3b0eef6900f0bc05"),
        email:"king00@email.com",
        password:"abc.123",
        user_name:"King Lab",
        birth:new Date('2000-07-19T'),
        gender:"male",
        country:"Spain",
        postal_code:"02348",
        subscriptions: [ObjectId("6395029db784244315bb574a"), ObjectId("63950374f30cb3230e18a0dd")]
    }
])
db.channels.insertMany([
    {
        _id: ObjectId("6395029db784244315bb574a"),
        user: ObjectId("6394ff6f7124c6a306f58e9d"),
        channel_name:"Chill Music Videos",
        description:"Relaxing music videos",
        creation_date:new Date("2021-02-24T03:12:26Z")
    },
    {
        _id: ObjectId("63950374f30cb3230e18a0dd"),
        user: ObjectId("6394ff994fb825d318befae5"),
        channel_name:"Premier Padel",
        description:"The home of Premier Padel - the official new global Padel tour. Subscribe for news, highlights, interviews, behind the scene footage, and more.",
        creation_date:new Date('2021-04-27T18:45:21Z')
    }
])
db.videos.insertMany([
    {
        _id: ObjectId("639500752af4313460e3931a"),
        user: ObjectId("6394ff6f7124c6a306f58e9d"),
        channel: ObjectId("6395029db784244315bb574a"),
        date:new Date("2021-03-10T05:15:12Z"),
        title:"Elegant Jazz - Good morning mood with Jazz Cafe",
        description:"Elegant Jazz - Good morning mood with Jazz Cafe - Cheerful Jazz &  Bossa Nova for the best mood",
        size:"57 Mb",
        file_name:"jazz_music.mpeg",
        duration: '00:32:16',
        thumbnail:"jazz_image.jpg",
        reproductions:18293,
        state: "public",
        reactions: {
            likes: [        
            {
                user: ObjectId("6394ff994fb825d318befae5"),
                date: new Date("2021-11-12T11:55:09Z")
            },
            {
                user: ObjectId("6394ff9d3b0eef6900f0bc05"),
                date: new Date("2021-10-25T08:38:27Z")
            }]
        },
        comments: {
            user: ObjectId("6394ff994fb825d318befae5"),
            text:"Great video!",
            date: "2021-10-16 15:02:13",
            likes: {
                user: ObjectId("6394ff6f7124c6a306f58e9d"),
                date: new Date("2021-11-02T12:50:45Z")
            }
        },
        tags: [ObjectId("6395015a0e672592cf02772c"),]
    },
    {
        _id: ObjectId("6395007afd1e21fc0cf565fd"),
        user: ObjectId("6394ff6f7124c6a306f58e9d"),
        channel: ObjectId("6395029db784244315bb574a"),
        date: new Date("2021-06-27T09:55:53Z"),
        title:"coffee shop radio // 24/7 lofi hip-hop beats",
        description:"This stream's playlist is curated with an emphasis on meditation and relaxation. No vocal samples, just smooth beats to relax the mind after a long day",
        size:"36 Mb",
        file_name:"coffee_shop_radio.mpeg",
        duration: '00:28:15',
        thumbnail:"coffee_shop_radio.jpg",
        reproductions:2394,
        state: "public",
        reactions: {
            likes: 
            {
                user: ObjectId("6394ff994fb825d318befae5"),
                date: new Date("2021-10-25T08:38:27Z")
            },
            dislikes: {
                user: ObjectId("6394ff9d3b0eef6900f0bc05"),
                date: new Date("2021-10-25T08:38:27Z")
            }
        },
        comments: {
            user: ObjectId("6394ff994fb825d318befae5"),
            text:"love this music, so relaxing",
            date: new Date("2021-10-16T15:02:13Z")
        },
        tags: [ObjectId("6395015a0e672592cf02772c"),]
    },
    {
        _id: ObjectId("6395009b4bb351dea03d4af8"),
        user: ObjectId("6394ff994fb825d318befae5"),
        channel: ObjectId("63950374f30cb3230e18a0dd"),
        date: new Date('2021-04-28T18:45:21Z'),
        title:"(Replay) GNP Mexico Premier Padel Major: Grand Stand",
        description:"Follow the live score",
        size:"36 Mb",
        file_name:"padel.mpeg",
        duration:"02:36:18",
        thumbnail:"padel.jpg",
        reproductions:14526,
        state:'public',
        reactions: {
            likes: {
                user: ObjectId("6394ff9d3b0eef6900f0bc05"),
                date: new Date("2021-12-18T15:20:22Z")
            },
        },
        comments: {
            user: ObjectId("6394ff9d3b0eef6900f0bc05"),
            text:"best play!!!",
            date: new Date("2021-12-01T13:13:53Z"),
            dislikes: {
                user: ObjectId("6394ff6f7124c6a306f58e9d"),
                date: new Date("2021-10-22T22:38:21Z")
            }
        },
        tags: [ObjectId("63950173029aa08b387e7ef8"),]
    }
])
db.tags.insertMany([
    {
        _id: ObjectId("6395015a0e672592cf02772c"),
        name: "Música"
    },
    {
        _id: ObjectId("63950173029aa08b387e7ef8"),
        name: "Deporte"
    }
])
db.playlists.insertMany([
    {
        _id: ObjectId("6395043d10dbcaea39d73133"),
        user: ObjectId("6394ff9d3b0eef6900f0bc05"),
        name: "Chill Music",
        creation_date: new Date("2021-08-14T19:15:35Z"),
        state: "public",
        videos: [ObjectId("639500752af4313460e3931a"), ObjectId("6395007afd1e21fc0cf565fd")]
    }
])