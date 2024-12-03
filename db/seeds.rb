# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "Destroying DB"

Ticket.destroy_all
Communication.destroy_all
Team.destroy_all
User.destroy_all

puts "Creating users..."
user_ceo = User.create!(first_name: "Martine", last_name: "Gabin", email: "martine.gabin@gmail.com", password: "azerty", role:"back_office")
user_sales_manager = User.create!(first_name: "Henri", last_name: "Dupond", email: "henri.dupond@gmail.com", password: "azerty", role:"back_office")
user_sales_employee_1 = User.create!(first_name: "Roland", last_name: "Courbis", email: "roland.courbis@gmail.com", password: "azerty", role: "back_office")
user_sav_manager = User.create!(first_name: "Charlotte", last_name: "Vidal", email: "charlotte.vidal@gmailcom", password: "azerty", role:"back_office")
user_sav_employee_1 = User.create!(first_name: "Charles", last_name: "Musk", email: "charles.musk@gmail.com", password: "azerty", role: "back_office")
user_rh_manager = User.create!(first_name: "Louise", last_name: "Denguin", email: "louise.denguin@gmail.com", password: "azerty", role: "back_office")
user_rh_employee_1 = User.create!(first_name: "Elon", last_name: "Musk", email: "elon.musk@gmail.com", password: "azerty", role: "back_office")
user_logistic_manager = User.create!(first_name: "Corinne", last_name: "Pepin", email: "corinne.pepin@gmail.com", password: "azerty", role: "back_office")
user_logistic_operator_1 = User.create!(first_name: "Martin", last_name: "Ponan", email: "martin.ponan@gmail.com", password: "azerty", role: "field")
user_logistic_operator_2 = User.create!(first_name: "Johana", last_name: "Creille", email: "johana.Creille@gmail.com", password: "azerty", role: "field")
user_logistic_operator_3 = User.create!(first_name: "Jean", last_name: "Hervin", email: "jean.hervin@gmail.com", password: "azerty", role: "field")
user_logistic_operator_4 = User.create!(first_name: "Léonore", last_name: "Lion", email: "léonore.lion@gmail.com", password: "azerty", role: "field")
user_logistic_operator_5 = User.create!(first_name: "Paul", last_name: "Gerbier", email: "paul.gerbier@gmail.com", password: "azerty", role: "field")
user_logistic_operator_6 = User.create!(first_name: "Nicolas", last_name: "Paterne", email: "nicolas.paterne@gmail.com", password: "azerty", role: "field")

puts "Creating teams"
comex = Team.create!(name: "Comex")
sales = Team.create!(name: "Sales")
sav = Team.create!(name: "SAV")
rh = Team.create!(name: "RH")
logistique = Team.create!(name: "Logistique")

puts "Creating team members"
TeamMember.create!(team: comex, user: user_ceo)
TeamMember.create!(team: comex, user: user_sales_manager)
TeamMember.create!(team: comex, user: user_sav_manager)
TeamMember.create!(team: comex, user: user_rh_manager)
TeamMember.create!(team: comex, user: user_logistic_manager)
TeamMember.create!(team: sales, user: user_sales_manager)
TeamMember.create!(team: sales, user: user_sales_employee_1)
TeamMember.create!(team: sav, user: user_sav_manager)
TeamMember.create!(team: sav, user: user_sav_employee_1)
TeamMember.create!(team: rh, user: user_rh_manager)
TeamMember.create!(team: rh, user: user_rh_employee_1)
TeamMember.create!(team: rh, user: user_ceo)

TeamMember.create!(team: logistique, user: user_logistic_manager)
TeamMember.create!(team: logistique, user: user_logistic_operator_1)
TeamMember.create!(team: logistique, user: user_logistic_operator_2)
TeamMember.create!(team: logistique, user: user_logistic_operator_3)
TeamMember.create!(team: logistique, user: user_logistic_operator_4)
TeamMember.create!(team: logistique, user: user_logistic_operator_5)
TeamMember.create!(team: logistique, user: user_logistic_operator_6)

# TODO

puts "Creating Communications"
communication1 = Communication.create!(user: user_logistic_manager, teams: [logistique], title: "Transporteur enervé", category: "Process", content: "Lorsqu'un transporteur est enervé, aller chercher Cyril, c'est à lui de gérer ces situations")
communication2 = Communication.create!(user: user_logistic_manager, teams: [logistique], title: "Etiquette Jaune", category: "Process", content: "lorsqu'il y a une étiquette jaune sur un carton HB pendant la mise en stock => différentes ref => bien tout séparer et mettre en stock une seule ref par emplacement")
communication3 = Communication.create!(user: user_logistic_manager, teams: [logistique], title: "Tapis de laine", category: "Qualité", content: "Désormais, Tapis de laine ne devrait plus partir en collissimo, mais en priorité en Colis privé, preter attention à ce que ne soit pas Collissmio lorsqu'on a du tapis de laine, informer le manager de prod si c'est le cas!!")
communication4 = Communication.create!(user: user_rh_manager, teams: [comex, sales, sav, rh, logistique], title: "congé Noël", category: "RH", content: "Pour les congés de Noël, le tour pour Noël et le nouvel an sont passés. Pour ceux qui veulent encore pour le premier tour, à faire aujourd'hui!! le premier tour de congé se fini fin janvier, deuxieme tour pour avril. Jusqu'a la fin de semaine pour faire les demandes pour le scond tour. pour toutes les perzonnes en log, se référer à Pierre, pour les autres à Antho.")
communication5 = Communication.create!(user: user_logistic_manager, teams: [logistique], title: "Produit dangereux", category:"Sécurité", content: "Seulement les personnes formés aux produits dangereux peuvent chargé le chariot produit dangereux et le manipuler !!")
communication6 = Communication.create!(user: user_logistic_manager, teams: [logistique], title: "Chariot élevateur", category:"Outils", content: "bien laisser les clés sur le chariot elevateur merci !!")
communication7 = Communication.create!(user: user_ceo, teams: [comex, sales, sav, rh, logistique], title: "Rapporter les problèmes sur froglab", category: "Lean", content: "Merci de bien rapporter les problèmes et les améliorations sur Froglab quand ils vous viennent afin déviter qu'ils ne soient oublié merci !!")

# Lean, Tools, Quality, Process, Maintenance, Security, RH

puts "Creating tickets..."
ticket1 = Ticket.create!(
  title: "Zone de chargement non clairement identifiée",
  content: "Je ne comprends pas à quelle porte les camions pour le chargement des pièces sont censés arriver. Il n'y a plus de balisage, ce qui crée de la confusion et des retards.",
  priority: 1,
  category: "Process",
  status: 1,
  user: user_logistic_operator_3,
  manager: user_logistic_manager,
  team: logistique
)

ticket1.photos.attach(
  io: URI.open("https://res.cloudinary.com/dybh6frfh/image/upload/v1733240923/zone-chargement_aarkly.jpg"),
  filename: "photo1.jpg",
  content_type: "image/jpeg"
)

ticket2 = Ticket.create!(
  title: "Formation des nouveaux employés incomplète",
  content: "Les nouveaux employés n'ont pas reçu la formation complète sur le tri et l'étiquetage des colis, causant des erreurs dans les envois et des retards.",
  priority: 0,
  category: "Lean",
  status: 1,
  user: user_rh_manager,
  manager: user_logistic_manager,
  team: rh
)

ticket3 = Ticket.create!(
  title: "Scanner pour les colis défectueux",
  content: "Plusieurs scanners pour lire les codes-barres des colis sont en panne, ralentissant considérablement le traitement des commandes et augmentant les erreurs.",
  priority: 2,
  category: "Outils",
  status: 1,
  user: user_logistic_operator_4,
  manager: user_logistic_manager,
  team: logistique
)

ticket3.photos.attach(
  io: URI.open("https://res.cloudinary.com/dybh6frfh/image/upload/v1733240922/scanner-defectueux_bz1qol.jpg"),
  filename: "photo3.jpg",
  content_type: "image/jpeg"
)

ticket4 = Ticket.create!(
  title: "Emballages endommagés fréquemment",
  content: "De nombreux colis arrivent avec des emballages endommagés, ce qui nuit à la satisfaction client et provoque des retours fréquents.",
  priority: 1,
  category: "Qualité",
  status: 1,
  user: user_sav_employee_1,
  manager: user_logistic_manager,
  team: logistique
)

ticket4.photos.attach(
  io: URI.open("https://res.cloudinary.com/dybh6frfh/image/upload/v1733240922/colis-endommag%C3%A9s_mbfzuy.jpg"),
  filename: "photo4.jpg",
  content_type: "image/jpeg"
)

ticket5 = Ticket.create!(
  title: "Problème de maintenance sur le tapis roulant",
  content: "Le tapis roulant principal de la zone d'expédition tombe régulièrement en panne, provoquant des arrêts prolongés et des retards dans la préparation des commandes.",
  priority: 2,
  category: "Maintenance",
  status: 2,
  user: user_logistic_operator_5,
  team: logistique
)

ticket5.photos.attach(
  io: URI.open("https://res.cloudinary.com/dybh6frfh/image/upload/v1733240921/tapis-cass%C3%A9_xkn0bu.png"),
  filename: "photo5.png",
  content_type: "image/png"
)

ticket6 = Ticket.create!(
  title: "Protocole de sécurité incendie obsolète",
  content: "Le protocole actuel pour les exercices d'incendie n'est plus à jour, ce qui pourrait entraîner des risques en cas d'incident réel. Il faut le réviser rapidement.",
  priority: 2,
  category: "Securité",
  status: 0,
  user: user_logistic_operator_3,
  team: logistique
)

ticket6.photos.attach(
  io: URI.open("https://res.cloudinary.com/dybh6frfh/image/upload/v1733240921/plan-issue-de-secours-1024x594_xlkv4q.jpg"),
  filename: "photo6.jpg",
  content_type: "image/jpeg"
)

ticket7 = Ticket.create!(
  title: "ticket comex",
  content: "Le protocole comex doit être revu",
  priority: 1,
  category: "Management",
  status: 0,
  user: user_rh_manager,
  team: comex
)

ticket7.photos.attach(
  io: URI.open("https://res.cloudinary.com/dybh6frfh/image/upload/v1733240924/comex_tm5eml.png"),
  filename: "photo7.png",
  content_type: "image/png"
)

puts "Creating actions..."

# Action pour le ticket 1 (Process)
Action.create!(
  title: "Installer un balisage temporaire dans la zone de chargement",
  due_date: Date.today + 3, # Échéance dans 3 jours
  status: 0, # Statut initial : 0 (non commencé)
  content: "Mettre en place un balisage clair pour indiquer aux chauffeurs où se rendre pour le chargement. Prévoir une signalisation temporaire.",
  user: user_ceo, # Responsable de l'action
  ticket: ticket1
)

# Action pour le ticket 2 (Leam)
Action.create!(
  title: "Organiser une session de formation pour les nouveaux employés",
  due_date: Date.today + 7, # Échéance dans une semaine
  status: 0,
  content: "Préparer une session pour couvrir les règles de tri, la manipulation des colis fragiles et l'étiquetage. Envoyer une invitation à tous les employés concernés.",
  user: user_sav_manager,
  ticket: ticket2
)

# Action pour le ticket 3 (Tools)
Action.create!(
  title: "Réparer ou remplacer les scanners défectueux",
  due_date: Date.today + 2, # Échéance urgente
  status: 0,
  content: "Vérifier les scanners des zones B, C et D, et effectuer les réparations nécessaires ou les remplacer si nécessaire.",
  user: user_rh_employee_1,
  ticket: ticket3
)

# Action pour le ticket 4 (Quality)
Action.create!(
  title: "Réviser la qualité des emballages avec le fournisseur",
  due_date: Date.today + 10, # Échéance modérée
  status: 0,
  content: "Organiser une réunion avec le fournisseur d'emballages pour discuter des problèmes récents et demander une amélioration de la qualité. Envisager une alternative en cas de non-conformité.",
  user: user_logistic_operator_5,
  ticket: ticket4
)

Action.create!(
  title: "Former les opérateurs",
  due_date: Date.today + 20, # Échéance modérée
  status: 0,
  content: "",
  user: user_logistic_operator_3,
  ticket: ticket4
)

Action.create!(
  title: "Evaluer la pertinence des outillages d'emballage",
  due_date: Date.today + 3, # Échéance modérée
  status: 1,
  content: "",
  user: user_logistic_manager,
  ticket: ticket4
)

Action.create!(
  title: "action 1 du ticket 7",
  due_date: Date.today + 3, # Échéance modérée
  status: 0,
  content: "",
  user: user_ceo,
  ticket: ticket7
)

Action.create!(
  title: "action 2 du ticket 7",
  due_date: Date.today + 3, # Échéance modérée
  status: 1,
  content: "",
  user: user_rh_manager,
  ticket: ticket7
)

# Action pour le ticket 5 (Maintenance)
Action.create!(
  title: "Planifier une maintenance préventive pour le tapis roulant",
  due_date: Date.today + 5, # Échéance à court terme
  status: 0,
  content: "Mettre en place un plan d'entretien préventif mensuel pour éviter les pannes récurrentes sur le tapis roulant principal. Coordonner avec l'équipe de maintenance.",
  user: user_logistic_operator_2,
  ticket: ticket5
)

Action.create!(
  title: "Mettre à jour le protocole de sécurité incendie",
  due_date: Date.today + 14, # Échéance à moyen terme
  status: 0,
  content: "Revoir les protocoles existants et inclure les nouvelles zones et procédures. Organiser un exercice de sécurité pour tester les nouvelles directives.",
  user: user_logistic_operator_5,
  ticket: ticket6
)

puts "Actions created..."

# Commentaires pour le ticket 1 (Process)
Comment.create!(content: "Je propose de mettre un panneau temporaire en attendant une solution définitive.", user: user_ceo, ticket: ticket1)
Comment.create!(content: "Bonne idée, mais on devrait aussi envoyer une note aux chauffeurs pour clarifier.", user: user_sales_manager, ticket: ticket1)
Comment.create!(content: "J'ai ajouté ce problème à la liste des priorités de la semaine prochaine.", user: user_sales_employee_1, ticket: ticket1)

# Commentaires pour le ticket 2 (Leam)
Comment.create!(content: "Est-ce qu'on sait exactement quelle partie de la formation est manquante ?", user: user_sav_manager, ticket: ticket2)
Comment.create!(content: "Il semble que ce soit principalement sur les règles de tri et la manipulation des colis fragiles.", user: user_sav_employee_1, ticket: ticket2)
Comment.create!(content: "Je vais planifier une session de formation pour la semaine prochaine.", user: user_rh_manager, ticket: ticket2)

# Commentaires pour le ticket 3 (Tools)
Comment.create!(content: "Les scanners concernés sont ceux de la zone B et C, correct ?", user: user_rh_employee_1, ticket: ticket3)
Comment.create!(content: "Oui, mais il faudrait vérifier aussi la zone D, on a eu des remontées similaires.", user: user_logistic_manager, ticket: ticket3)
Comment.create!(content: "J'ai demandé une intervention de l'équipe technique, ça devrait être réglé d'ici demain.", user: user_logistic_operator_1, ticket: ticket3)
Comment.create!(content: "Merci, je vérifie demain matin si tout est opérationnel.", user: user_rh_employee_1, ticket: ticket3)

# Commentaires pour le ticket 4 (Quality)
Comment.create!(content: "Peut-être qu'on devrait revoir le fournisseur d'emballages ?", user: user_logistic_operator_5, ticket: ticket4)
Comment.create!(content: "Bonne idée, mais ça peut prendre du temps. En attendant, on pourrait renforcer les colis en interne.", user: user_logistic_operator_3, ticket: ticket4)
Comment.create!(content: "J'ai demandé un audit des derniers lots reçus pour voir si le problème est récurrent.", user: user_logistic_operator_3, ticket: ticket4)
Comment.create!(content: "Merci, tiens-nous au courant des résultats.", user: user_logistic_operator_5, ticket: ticket4)

# Commentaires pour le ticket 5 (Maintenance)
Comment.create!(content: "La panne semble liée à un problème électrique, l'équipe de maintenance est sur place.", user: user_logistic_operator_2, ticket: ticket5)
Comment.create!(content: "On pourrait prévoir un entretien préventif régulier pour éviter que cela ne se reproduise.", user: user_logistic_operator_5, ticket: ticket5)
Comment.create!(content: "D'accord, je vais ajouter cela à notre planning mensuel.", user: user_logistic_operator_2, ticket: ticket5)

# Commentaires pour le ticket 6 (Security)
Comment.create!(content: "Est-ce qu'on a une date pour la prochaine révision des protocoles ?", user: user_logistic_operator_5, ticket: ticket6)
Comment.create!(content: "Pas encore, mais je pense qu'on peut viser la fin du mois.", user: user_logistic_operator_6, ticket: ticket6)
Comment.create!(content: "On pourrait aussi organiser un exercice pour tester les procédures actuelles.", user: user_logistic_operator_5, ticket: ticket6)
Comment.create!(content: "Bonne idée, je vais ajouter cela à notre calendrier.", user: user_logistic_operator_6, ticket: ticket6)
Comment.create!(content: "Merci, je vais vérifier les documents avant la réunion.", user: user_logistic_operator_5, ticket: ticket6)

puts "Comments created..."
