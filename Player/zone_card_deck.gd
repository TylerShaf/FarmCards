class_name ZoneDeck
extends Resource

enum Type {HAND, DISCARD, DECK, STORE, SCORE, STOREDECK}

@export var deck: Array

func _ready():
	add_card("mega_melon")
#func shuffle_deck():

# Looks up the card_name to determine which card it refers to, then adds it to the deck
func add_card(card_name):
	var new_card = Card.new()
	new_card.set_card_stats("card_name")
	deck.append(new_card)

# Looks up the card in the index, removes it from deck, and returns the removed card
#func remove_card(index):
