# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Release.delete_all
Client.delete_all
App.delete_all


apps = App.create([{ name: "VMM" }, { name: "Magellan" }, { name: "CPC" },
    { name: "RBM Validator" }])

vmm = App.find_by_name("VMM")

clients = Client.create([
  { name: "AT&T", abbreviated_name: "att", app: vmm },
  { name: "Best Buy", abbreviated_name: "bby", app: vmm },
  { name: "Capital One", abbreviated_name: "cap", app: vmm },
  { name: "Cox", abbreviated_name: "cox", app: vmm },
  { name: "Cricket", abbreviated_name: "cricket", app: vmm },
  { name: "O2", abbreviated_name: "o2", app: vmm },
  { name: "Optus", abbreviated_name: "optus", app: vmm },
  { name: "T-mobile", abbreviated_name: "tmobile", app: vmm },
  { name: "UBC", abbreviated_name: "ubc", app: vmm },
  { name: "Verizon Wireless", abbreviated_name: "vzw", app: vmm },
  { name: "Sunglass Hut AUS/NZL", abbreviated_name: "sgh-anz", app: vmm }
  ])
