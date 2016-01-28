require "faker"

challenge = Challenge.create(
  title: "White Mountain Summitter",
  tagline: "Climb all 48 4000' peaks in New Hampshire's White Mountains",
  description: Faker::Lorem.paragraph(5)
)

mr_prez = Challenge.create(
  title: "Hey Mr. President",
  tagline: "Grab all 7 peaks in the infamous Presidential Traverse",
  description: Faker::Lorem.paragraph(5)
)

prez_traverse = Challenge.create(
  title: "Presidential Traverse",
  tagline: "One trek - 7 peaks. Time to grab your walking boots.",
  description: Faker::Lorem.paragraphs(5)
)

trek1 = Trek.create(
  title: "Mount Washington",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.270489",
  lon: "-71.303246"
)

trek2 = Trek.create(
  title: "Mount Adams",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.32",
  lon: "-71.291"
)

trek3 = Trek.create(
  title: "Mount Jefferson",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.304",
  lon: "-71.318"
)

trek4 = Trek.create(
  title: "Mount Monroe",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.2548",
  lon: "-71.3213"
)

trek5 = Trek.create(
  title: "Mount Madison",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.3283",
  lon: "-71.2783"
)

trek6 = Trek.create(
  title: "Mount Lafayette",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.1608",
  lon: "-71.6444"
)

trek7 = Trek.create(
  title: "Mount Lincoln",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.16080",
  lon: "-71.6444"
)

trek8 = Trek.create(
  title: "South Twin Mountain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.188",
  lon: "-71.555"
)

trek9 = Trek.create(
  title: "Carter Dome",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.2673",
  lon: "-71.179"
)

trek10 = Trek.create(
  title: "Mount Moosilauke",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.02440",
  lon: "-71.83140"
)

trek11 = Trek.create(
  title: "Mount Eisenhower",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.2403",
  lon: "-71.3504"
)

trek12 = Trek.create(
  title: "North Twin Mountain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.2027",
  lon: "-71.5574"
)

trek13 = Trek.create(
  title: "Mount Carrigain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.093",
  lon: "-71.448"
)

trek14 = Trek.create(
  title: "Mount Bond",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.153",
  lon: "-71.532"
)

trek15 = Trek.create(
  title: "Middle Carter Mountain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.3031",
  lon: "-71.1678"
)

trek16 = Trek.create(
  title: "West Bond",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.15473",
  lon: "-71.54351"
)

trek17 = Trek.create(
  title: "Mount Garfield",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.1869",
  lon: "-71.6114"
)

trek18 = Trek.create(
  title: "Mount Liberty",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.116",
  lon: "-71.643"
)

trek19 = Trek.create(
  title: "South Carter",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.3031",
  lon: "-71.1678"
)

trek20 = Trek.create(
  title: "Wildcat Mountain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.2592",
  lon: "-71.202"
)

trek21 = Trek.create(
  title: "Mount Hancock",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.0834",
  lon: "-71.4936"
)

trek22 = Trek.create(
  title: "South Kinsman",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.12297",
  lon: "-71.73655"
)

trek23 = Trek.create(
  title: "Mount Field",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.196",
  lon: "-71.435"
)

trek24 = Trek.create(
  title: "Mount Osceola",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.0008",
  lon: "-71.536"
)

trek25 = Trek.create(
  title: "Mount Flume",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.1089",
  lon: "-71.6283"
)

trek26 = Trek.create(
  title: "South Hancock",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.0834",
  lon: "-71.4936"
)

trek27 = Trek.create(
  title: "Mount Pierce",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.226",
  lon: "-71.366"
)

trek28 = Trek.create(
  title: "North Kinsman",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.13337",
  lon: "-71.73691"
)

trek29 = Trek.create(
  title: "Mount Willey",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.1836",
  lon: "-71.4219"
)

trek30 = Trek.create(
  title: "Bondcliff",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.1408",
  lon: "-71.5409"
)

trek31 = Trek.create(
  title: "Zealand Mountain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.179",
  lon: "-71.521"
)

trek32 = Trek.create(
  title: "North Tripyramid",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "43.9683",
  lon: "-71.44"
)

trek33 = Trek.create(
  title: "Mount Cabot",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.506",
  lon: "-71.4144"
)

trek34 = Trek.create(
  title: "East Osceola",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.00603",
  lon: "-71.5204"
)

trek35 = Trek.create(
  title: "Middle Tripyramid",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "43.9683",
  lon: "-71.44"
)

trek36 = Trek.create(
  title: "Cannon Mountain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.16",
  lon: "-71.7"
)

trek37 = Trek.create(
  title: "Wildcat D",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.2592",
  lon: "-71.202"
)

trek38 = Trek.create(
  title: "Mount Hale",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.222",
  lon: "-71.513"
)

trek39 = Trek.create(
  title: "Mount Jackson",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.2031",
  lon: "-71.3747"
)

trek40 = Trek.create(
  title: "Mount Tom",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.21",
  lon: "-71.446"
)

trek41 = Trek.create(
  title: "Mount Moriah",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.34",
  lon: "-71.132"
)

trek42 = Trek.create(
  title: "Mount Passaconaway",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "43.9548",
  lon: "-71.3808"
)

trek43 = Trek.create(
  title: "Owl's Head Mountain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.1441",
  lon: "-71.605"
)

trek44 = Trek.create(
  title: "Galehead Mountain",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.185",
  lon: "-71.574"
)

trek45 = Trek.create(
  title: "Mount Whiteface",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "43.9367",
  lon: "-71.4078"
)

trek46 = Trek.create(
  title: "Mount Waumbek",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.4326",
  lon: "-71.4177"
)

trek47 = Trek.create(
  title: "Mount Isolation",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.2148",
  lon: "-71.3094"
)

trek48 = Trek.create(
  title: "Mount Tecumseh",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "43.9672",
  lon: "-71.5586"
)

trek49 = Trek.create(
  title: "Presidential Traverse",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5),
  lat: "44.27011",
  lon: "-71.36794"
)

# White Mountain Summitter Challenge
Step.create(challenge_id: challenge.id, trek_id: trek1.id)
Step.create(challenge_id: challenge.id, trek_id: trek2.id)
Step.create(challenge_id: challenge.id, trek_id: trek3.id)
Step.create(challenge_id: challenge.id, trek_id: trek4.id)
Step.create(challenge_id: challenge.id, trek_id: trek5.id)
Step.create(challenge_id: challenge.id, trek_id: trek6.id)
Step.create(challenge_id: challenge.id, trek_id: trek7.id)
Step.create(challenge_id: challenge.id, trek_id: trek8.id)
Step.create(challenge_id: challenge.id, trek_id: trek9.id)
Step.create(challenge_id: challenge.id, trek_id: trek10.id)
Step.create(challenge_id: challenge.id, trek_id: trek11.id)
Step.create(challenge_id: challenge.id, trek_id: trek12.id)
Step.create(challenge_id: challenge.id, trek_id: trek13.id)
Step.create(challenge_id: challenge.id, trek_id: trek14.id)
Step.create(challenge_id: challenge.id, trek_id: trek15.id)
Step.create(challenge_id: challenge.id, trek_id: trek16.id)
Step.create(challenge_id: challenge.id, trek_id: trek17.id)
Step.create(challenge_id: challenge.id, trek_id: trek18.id)
Step.create(challenge_id: challenge.id, trek_id: trek19.id)
Step.create(challenge_id: challenge.id, trek_id: trek20.id)
Step.create(challenge_id: challenge.id, trek_id: trek21.id)
Step.create(challenge_id: challenge.id, trek_id: trek22.id)
Step.create(challenge_id: challenge.id, trek_id: trek23.id)
Step.create(challenge_id: challenge.id, trek_id: trek24.id)
Step.create(challenge_id: challenge.id, trek_id: trek25.id)
Step.create(challenge_id: challenge.id, trek_id: trek26.id)
Step.create(challenge_id: challenge.id, trek_id: trek27.id)
Step.create(challenge_id: challenge.id, trek_id: trek28.id)
Step.create(challenge_id: challenge.id, trek_id: trek29.id)
Step.create(challenge_id: challenge.id, trek_id: trek30.id)
Step.create(challenge_id: challenge.id, trek_id: trek31.id)
Step.create(challenge_id: challenge.id, trek_id: trek32.id)
Step.create(challenge_id: challenge.id, trek_id: trek33.id)
Step.create(challenge_id: challenge.id, trek_id: trek34.id)
Step.create(challenge_id: challenge.id, trek_id: trek35.id)
Step.create(challenge_id: challenge.id, trek_id: trek36.id)
Step.create(challenge_id: challenge.id, trek_id: trek37.id)
Step.create(challenge_id: challenge.id, trek_id: trek38.id)
Step.create(challenge_id: challenge.id, trek_id: trek39.id)
Step.create(challenge_id: challenge.id, trek_id: trek40.id)
Step.create(challenge_id: challenge.id, trek_id: trek41.id)
Step.create(challenge_id: challenge.id, trek_id: trek42.id)
Step.create(challenge_id: challenge.id, trek_id: trek43.id)
Step.create(challenge_id: challenge.id, trek_id: trek44.id)
Step.create(challenge_id: challenge.id, trek_id: trek45.id)
Step.create(challenge_id: challenge.id, trek_id: trek46.id)
Step.create(challenge_id: challenge.id, trek_id: trek47.id)
Step.create(challenge_id: challenge.id, trek_id: trek48.id)

# Hey Mr. President Challenge
Step.create(challenge: mr_prez, trek: trek1)
Step.create(challenge: mr_prez, trek: trek2)
Step.create(challenge: mr_prez, trek: trek3)
Step.create(challenge: mr_prez, trek: trek4)
Step.create(challenge: mr_prez, trek: trek5)
Step.create(challenge: mr_prez, trek: trek11)
Step.create(challenge: mr_prez, trek: trek27)

# Presidential Traverse
Step.create(challenge: prez_traverse, trek: trek49)
