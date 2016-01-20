require "faker"

challenge = Challenge.create(
  title: "White Mountain Summitter",
  tagline: "Climb all 48 4000' peaks in New Hampshire's White Mountains",
  description: Faker::Lorem.paragraph(5)
)

trek = Trek.create(
  title: "Climb Mt. Washington",
  location: "New Hampshire",
  description: Faker::Lorem.paragraph(5)
)

Step.create(
  challenge_id: challenge.id,
  trek_id: trek.id
)
