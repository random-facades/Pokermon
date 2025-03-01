-- Thwackey 811
-- Rillaboom 812
-- Scorbunny 813
-- Raboot 814
-- Cinderace 815
-- Sobble 816
-- Drizzile 817
-- Inteleon 818
-- Skwovet 819
-- Greedent 820
-- Rookidee 821
-- Corvisquire 822
-- Corviknight 823
-- Blipbug 824
local blipbug={
  name = "blipbug", 
  pos = {x = 0, y = 1},
  config = {extra = {rounds = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
		return {vars = {center.ability.extra.rounds}}
  end,
  rarity = 1,
  cost = 5,
  stage = "Basic",
  ptype = "Grass",
  atlas = "Pokedex8",
  blueprint_compat = false,
  calculate = function(self, card, context)
    return level_evo(self, card, context, "j_poke_dottler")
  end,
  add_to_deck = function(self, card, from_debuff)
      G.E_MANAGER:add_event(Event({func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true end }))
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({func = function()
      for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
      end
      return true end }))
  end
}
-- Dottler 825
local dottler={
  name = "dottler", 
  pos = {x = 1, y = 1},
  config = {extra = {rounds = 4}},
  blueprint_compat = false,
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
		return {vars = {center.ability.extra.rounds}}
  end,
  rarity = 2,
  cost = 8,
  stage = "One",
  ptype = "Psychic",
  atlas = "Pokedex8",
  calculate = function(self, card, context)
    return level_evo(self, card, context, "j_poke_orbeetle")
  end,
  add_to_deck = function(self, card, from_debuff)
      G.E_MANAGER:add_event(Event({func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true end }))
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({func = function()
      for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
      end
      return true end }))
  end
}
-- Orbeetle 826
local orbeetle={
  name = "orbeetle", 
  pos = {x = 2, y = 1},
  config = {extra = {money = 2}}, 
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
		return {vars = {center.ability.extra.money}}
  end,
  rarity = "poke_safari",
  cost = 10,
  stage = "Two",
  ptype = "Psychic",
  atlas = "Pokedex8",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
      ease_poke_dollars(card, "orbeetle", card.ability.extra.money)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
      G.E_MANAGER:add_event(Event({func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true end }))
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({func = function()
      for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
      end
      return true end }))
  end,
}
-- Nickit 827
-- Thievul 828
-- Gossifleur 829
-- Eldegoss 830
-- Wooloo 831
-- Dubwool 832
-- Chewtle 833
-- Drednaw 834
-- Yamper 835
local yamper={
  name = "yamper", 
  pos = {x = 11, y = 1}, 
  config = {extra = {mult = 3, money = 3, rounds = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.mult, center.ability.extra.money, center.ability.extra.rounds}}
  end,
  rarity = 1, 
  cost = 5, 
  stage = "Basic", 
  ptype = "Lightning",
  atlas = "Pokedex8",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and next(context.poker_hands['Straight']) then
        ease_poke_dollars(card, "yamper", card.ability.extra.money)
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult
        }
      end
    end
    return level_evo(self, card, context, "j_poke_boltund")
  end,
}
-- Boltund 836
local boltund={
  name = "boltund", 
  pos = {x = 12, y = 1}, 
  config = {extra = {Xmult = 2, money = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.Xmult, center.ability.extra.money}}
  end,
  rarity = 3, 
  cost = 8, 
  stage = "One", 
  ptype = "Lightning",
  atlas = "Pokedex8",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and next(context.poker_hands['Straight']) then
        ease_poke_dollars(card, "boltund", card.ability.extra.money)
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult}}, 
          colour = G.C.MULT,
          Xmult_mod = card.ability.extra.Xmult
        }
      end
    end
  end,
}
-- Rolycoly 837
-- Carkol 838
-- Coalossal 839
-- Applin 840
return {name = "Pokemon Jokers 811-840", 
        list = {blipbug, dottler, orbeetle, yamper, boltund},
}