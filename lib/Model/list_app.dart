var listfavori = [];
var listfavoriid = [];

var listpub = [
  "https://firebasestorage.googleapis.com/v0/b/forssa-af695.appspot.com/o/Mr%20.%20Yummy.png?alt=media&token=bf19053a-e143-49ed-b12b-f851ecb4fb04",
  "https://firebasestorage.googleapis.com/v0/b/forssa-af695.appspot.com/o/Mr%20.%20Yummy%20(3).png?alt=media&token=de1000bf-b96a-4a3d-8c2b-0cb991c9113c",
  "https://firebasestorage.googleapis.com/v0/b/forssa-af695.appspot.com/o/Mr%20.%20Yummy%20(2).png?alt=media&token=fd0faa3b-99fc-462d-bbeb-3cc688f74351",
  "https://firebasestorage.googleapis.com/v0/b/forssa-af695.appspot.com/o/Mr%20.%20Yummy%20(1).png?alt=media&token=cc2e9de4-fd94-45c1-aa17-0ec1f334bcc6",
];
var listworkd = [
  {
    "title": "table cleaner",
    "ditails":
        "Part time table cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1187264465.jpg?crop=0.6672958942897593xw:1xh;center,top&resize=480:*",
    "id": "1",
    "date": "2022/3/4",
    "wilaya": "alger"
  },
  {
    "title": "essay writer",
    "ditails":
        "Part time table cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://www.cp24.com/polopoly_fs/1.5186089.1605197525!/httpImage/image.jpg_gen/derivatives/landscape_1020/image.jpg",
    "id": "2",
    "date": "2022/3/4",
    "wilaya": "alger"
  },
  {
    "title": "Building work",
    "ditails":
        "Part time table cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://image.shutterstock.com/image-photo/construction-worker-during-interior-decoration-260nw-1570552039.jpg",
    "id": "3",
    "date": "2022/3/4",
    "wilaya": "batna"
  },
  {
    "title": "delivery",
    "ditails":
        "Part time table cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://www.usine-digitale.fr/mediatheque/6/7/3/000859376_homePageUne/bolt.jpg",
    "id": "yrejrtj",
    "date": "2022/3/4",
    "wilaya": "alger"
  },
  {
    "title": "delivery",
    "ditails":
        "Part time table cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://www.usine-digitale.fr/mediatheque/6/7/3/000859376_homePageUne/bolt.jpg",
    "id": "ergerg",
    "date": "2022/3/4",
    "wilaya": "batna"
  },
  {
    "title": "rive",
    "ditails":
        "Part time table cleaner from Saturday to Monday cleaner from Saturday to Monday cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://symposium.org/wp-content/uploads/2021/11/Purpose-oriented-Leadership-in-the-New-World-of-Work.jpg",
    "id": "zefzefzef",
    "date": "2022/3/4",
    "wilaya": "alger"
  },
  {
    "title": "rive",
    "ditails":
        "Part time table cleaner from Saturday to Monday cleaner from Saturday to Monday cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://www.deutschland.de/sites/default/files/styles/crop_story_content/public/media/image/work-and-travel-germany-jobs.jpg?itok=hcoU96L-",
    "id": "ezfzaaef",
    "date": "2022/3/4",
    "wilaya": "batna"
  },
  {
    "title": "work",
    "ditails":
        "Part time table cleaner from Saturday to Monday cleaner from Saturday to Monday cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://web-static.wrike.com/cdn-cgi/image/width=900,format=auto/blog/content/uploads/2016/11/Working-Effectively.jpg?av=d6fcc963c5c6f56257c39149bf1fd177",
    "id": "ezfzzzef",
    "date": "2022/3/4",
    "wilaya": "alger"
  },
  {
    "title": "soge eco",
    "ditails":
        "Part time table cleaner from Saturday to Monday cleaner from Saturday to Monday cleaner from Saturday to Monday We only need two workers",
    "urlimage":
        "https://d3vt78ic2w6yaz.cloudfront.net/max-1000/blog/72-833f90Office-Skills-and-Fieldwork-Skills.webp",
    "id": "ezfzfef",
    "date": "2022/3/4",
    "wilaya": "batna"
  },
  {
    "title": "rive",
    "ditails":
        "Part time table cleaner from Saturday to Monday cleaner from Saturday to Monday cleaner from Saturday to Monday We only need two workers",
    "urlimage": "https://ichef.bbci.co.uk/images/ic/1024x576/p05glwjz.jpg",
    "id": "efzzefzefze",
    "date": "2022/3/4",
    "wilaya": "alger"
  },
];

var wilayat = const [
  'alger',
  'Tipaza',
  'batna',
  'bejaia',
  'biskra',
  'blida',
  'Stif',
  'Skikda',
  'annaba',
  'constantine',
  'Adrar',
  'Chlef',
  'Laghouat',
  'Oum El Bouaghi',
  'Béchar',
  'Bouira',
  'Tamanrasset',
  'Tébessa',
  'Tlemcen',
  'Tiaret',
  'Tizi Ouzou',
  'Djelfa',
  'Saïda',
  'Sidi Bel Abbès',
  'Annaba',
  'Guelma',
  'Médéa',
  'Mostaganem',
  'other',
];
