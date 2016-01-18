require "faker"

Challenge.create(
  title: "White Mountain Summitter",
  tagline: "Climb all 48 4000' peaks in New Hampshire's White Mountains",
  description: Faker::Lorem.paragraph(5)
)
