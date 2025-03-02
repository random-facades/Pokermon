--Code for pokemon jokers 151-180
local mew ={
  name = "mew", 
  pos = {x = 12, y = 11},
  soul_pos = { x = 0, y = 12},
  config = {extra = {percent = 15}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
    if not center.edition or (center.edition and not center.edition.negative) then
      info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end
    info_queue[#info_queue+1] = {key = 'percent_chance', set = 'Other', specific_vars = {center.ability.extra.percent}}
    return {vars = {1}}
  end,
  rarity = 4, 
  cost = 20, 
  stage = "Legendary",
  ptype = "Psychic",
  atlas = "Pokedex1",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.ending_shop then
      if pseudorandom('mew') < card.ability.extra.percent/100 then
        --create random joker
        local _card = create_card('Joker', G.consumeables, nil, nil, nil, nil, nil)
        local edition = {negative = true}
        _card:set_edition(edition, true)
        _card:add_to_deck()
        G.jokers:emplace(_card)
        card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
      else
        --create random consumable and apply negative
        local sets = {{set = "Tarot", message = localize('k_plus_tarot'), colour = G.C.PURPLE}, {set = "Spectral", message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral}, 
                      {set = "Item", message = localize('poke_plus_pokeitem'), colour = G.ARGS.LOC_COLOURS.pink}}
        local creation = pseudorandom_element(sets, pseudoseed('mewcreate'))
        
        local _card = create_card(creation.set, G.consumeables, nil, nil, nil, nil, nil)
        local edition = {negative = true}
        _card:set_edition(edition, true)
        _card:add_to_deck()
        G.consumeables:emplace(_card)
        card_eval_status_text(_card, 'extra', nil, nil, nil, {message = creation.message, colour = creation.colour})
      end
    end
  end,
}
-- Chikorita 152
local chikorita = {
  name = "chikorita",
  pos = {x = 0, y = 0},
  config = {extra = {money = 1, earned = 0, h_size = 1, d_size = 1}, evo_rqmt = 16},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.h_size, card.ability.extra.d_size, card.ability.extra.money, card.ability.extra.earned, self.config.evo_rqmt}}
  end,
  rarity = 2,
  cost = 5,
  stage = "Basic",
  ptype = "Grass",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.end_of_round and context.individual and context.cardarea == G.hand then
      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
      G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
      card.ability.extra.earned = card.ability.extra.earned + card.ability.extra.money
      return {
          dollars = card.ability.extra.money,
          card = context.other_card or card,
      }
    end
    return scaling_evo(self, card, context, "j_poke_bayleef", card.ability.extra.earned, self.config.evo_rqmt)
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
    ease_discard(-card.ability.extra.d_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
    ease_discard(card.ability.extra.d_size)
  end
}
-- Bayleef 153
local bayleef = {
  name = "bayleef",
  pos = {x = 1, y = 0},
  config = {extra = {money = 2, earned = 0, h_size = 1, d_size = 1}, evo_rqmt = 32},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.h_size, card.ability.extra.d_size, card.ability.extra.money, card.ability.extra.earned, self.config.evo_rqmt}}
  end,
  rarity = "poke_safari",
  cost = 8,
  stage = "One",
  ptype = "Grass",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.end_of_round and context.individual and context.cardarea == G.hand then
      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
      G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
      card.ability.extra.earned = card.ability.extra.earned + card.ability.extra.money
      return {
          dollars = card.ability.extra.money,
          card = context.other_card or card,
      }
    end
    return scaling_evo(self, card, context, "j_poke_meganium", card.ability.extra.earned, self.config.evo_rqmt)
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
    ease_discard(-card.ability.extra.d_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
    ease_discard(card.ability.extra.d_size)
  end
}
-- Meganium 154
local meganium = {
  name = "meganium",
  pos = {x = 2, y = 0},
  config = {extra = {money = 3, h_size = 1, d_size = 1}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.h_size, card.ability.extra.d_size, card.ability.extra.money}}
  end,
  rarity = "poke_safari",
  cost = 10,
  stage = "Two",
  ptype = "Grass",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.end_of_round and context.individual and context.cardarea == G.hand then
      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
      G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
      return {
          dollars = card.ability.extra.money,
          card = context.other_card or card,
      }
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
    ease_discard(-card.ability.extra.d_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
    ease_discard(card.ability.extra.d_size)
  end
}
-- Cyndaquil 155
local cyndaquil = {
  name = "cyndaquil",
  pos = {x = 3, y = 0},
  config = {extra = {mult = 0, mult_mod = 2, hands = 1, d_size = 1}, evo_rqmt = 16},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.d_size, card.ability.extra.hands, card.ability.extra.mult_mod, card.ability.extra.mult, self.config.evo_rqmt}}
  end,
  rarity = 2,
  cost = 5,
  stage = "Basic",
  ptype = "Fire",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and card.ability.extra.mult > 0 then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
          colour = G.C.CHIPS,
          mult_mod = card.ability.extra.mult
        }
      end
    end
    if context.end_of_round and not context.repetition and not context.individual and not context.blueprint and G.GAME.current_round.discards_left > 0 then
      card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * G.GAME.current_round.discards_left)
      card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_upgrade_ex")})
    end
    return scaling_evo(self, card, context, "j_poke_quilava", card.ability.extra.mult, self.config.evo_rqmt)
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
    ease_discard(card.ability.extra.d_size)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
    if to_decrease > 0 then
      ease_hands_played(-to_decrease)
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
    ease_discard(-card.ability.extra.d_size)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    if not from_debuff then
      ease_hands_played(card.ability.extra.hands)
    end
  end,
}
-- Quilava 156
local quilava = {
  name = "quilava",
  pos = {x = 4, y = 0},
  config = {extra = {mult = 0, mult_mod = 3, hands = 1, d_size = 1}, evo_rqmt = 32},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.d_size, card.ability.extra.hands, card.ability.extra.mult_mod, card.ability.extra.mult, self.config.evo_rqmt}}
  end,
  rarity = 2,
  cost = 8,
  stage = "One",
  ptype = "Fire",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and card.ability.extra.mult > 0 then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
          colour = G.C.CHIPS,
          mult_mod = card.ability.extra.mult
        }
      end
    end
    if context.end_of_round and not context.repetition and not context.individual and not context.blueprint and G.GAME.current_round.discards_left > 0 then
      card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * G.GAME.current_round.discards_left)
      card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_upgrade_ex")})
    end
    return scaling_evo(self, card, context, "j_poke_typhlosion", card.ability.extra.mult, self.config.evo_rqmt)
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
    ease_discard(card.ability.extra.d_size)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
    if to_decrease > 0 then
      ease_hands_played(-to_decrease)
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
    ease_discard(-card.ability.extra.d_size)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    if not from_debuff then
      ease_hands_played(card.ability.extra.hands)
    end
  end,
}
-- Typhlosion 157
local typhlosion = {
  name = "typhlosion",
  pos = {x = 5, y = 0},
  config = {extra = {mult = 0, mult_mod = 4, hands = 1, d_size = 1}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.d_size, card.ability.extra.hands, card.ability.extra.mult_mod, card.ability.extra.mult}}
  end,
  rarity = "poke_safari",
  cost = 10,
  stage = "Two",
  ptype = "Fire",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and card.ability.extra.mult > 0 then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
          colour = G.C.CHIPS,
          mult_mod = card.ability.extra.mult
        }
      end
    end
    if context.end_of_round and not context.repetition and not context.individual and not context.blueprint and G.GAME.current_round.discards_left > 0 then
      card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * G.GAME.current_round.discards_left)
      card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_upgrade_ex")})
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
    ease_discard(card.ability.extra.d_size)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
    if to_decrease > 0 then
      ease_hands_played(-to_decrease)
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
    ease_discard(-card.ability.extra.d_size)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    if not from_debuff then
      ease_hands_played(card.ability.extra.hands)
    end
  end,
}
-- Totodile 158
local totodile = {
  name = "totodile",
  pos = {x = 6, y = 0},
  config = {extra = {chips = 0, chip_mod = 1, hands = 1, h_size = 1}, evo_rqmt = 32},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.hands, card.ability.extra.h_size, card.ability.extra.chip_mod, card.ability.extra.chips, self.config.evo_rqmt}}
  end,
  rarity = 2,
  cost = 5,
  stage = "Basic",
  ptype = "Water",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT
        }
      elseif context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
    return scaling_evo(self, card, context, "j_poke_croconaw", card.ability.extra.chips, self.config.evo_rqmt)
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    if not from_debuff then
      ease_hands_played(card.ability.extra.hands)
    end
    G.hand:change_size(-card.ability.extra.h_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
    if to_decrease > 0 then
      ease_hands_played(-to_decrease)
    end
    G.hand:change_size(card.ability.extra.h_size)
  end
}
-- Croconaw 159
local croconaw = {
  name = "croconaw",
  pos = {x = 7, y = 0},
  config = {extra = {chips = 0, chip_mod = 2, hands = 1, h_size = 1}, evo_rqmt = 72},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.hands, card.ability.extra.h_size, card.ability.extra.chip_mod, card.ability.extra.chips, self.config.evo_rqmt}}
  end,
  rarity = "poke_safari",
  cost = 8,
  stage = "One",
  ptype = "Water",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT
        }
      elseif context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
    return scaling_evo(self, card, context, "j_poke_feraligatr", card.ability.extra.chips, self.config.evo_rqmt)
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    if not from_debuff then
      ease_hands_played(card.ability.extra.hands)
    end
    G.hand:change_size(-card.ability.extra.h_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
    if to_decrease > 0 then
      ease_hands_played(-to_decrease)
    end
    G.hand:change_size(card.ability.extra.h_size)
  end
}
-- Feraligatr 160
local feraligatr = {
  name = "feraligatr",
  pos = {x = 8, y = 0},
  config = {extra = {chips = 0, chip_mod = 3, hands = 1, h_size = 1}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.hands, card.ability.extra.h_size, card.ability.extra.chip_mod, card.ability.extra.chips}}
  end,
  rarity = "poke_safari",
  cost = 10,
  stage = "Two",
  ptype = "Water",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT
        }
      elseif context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    if not from_debuff then
      ease_hands_played(card.ability.extra.hands)
    end
    G.hand:change_size(-card.ability.extra.h_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
    if to_decrease > 0 then
      ease_hands_played(-to_decrease)
    end
    G.hand:change_size(card.ability.extra.h_size)
  end
}
-- Sentret 161
local sentret={
  name = "sentret",
  config = {extra = {mult = 0, mult_mod = 1, last_hand = 'None'}},
  pos = {x = 9, y = 0}, 
  rarity = 1, 
  cost = 5, 
  stage = "Basic", 
  ptype = "Colorless",
  atlas = "Pokedex2",
  blueprint_compat = true,
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
		return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, G.GAME.last_hand_played or "None"}}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint and card.ability.extra.last_hand ~= context.scoring_name then
        card.ability.extra.last_hand = G.GAME.last_hand_played
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT
        }
      elseif context.before and not context.blueprint and card.ability.extra.last_hand == context.scoring_name then
        card.ability.extra.mult = 0
        return {
          message = localize('k_reset'),
          card = card
        }
      end
      if context.joker_main then
        if card.ability.extra.mult > 0 then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end
    return scaling_evo(self, card, context, "j_poke_furret", card.ability.extra.mult, 15)
  end,
}
-- Furret 162
local furret={
  name = "furret",
  config = {extra = {mult = 0, mult_mod = 1, last_hand = 'None'}},
  pos = {x = 0, y = 1}, 
  rarity = 2, 
  cost = 6, 
  stage = "One", 
  ptype = "Colorless",
  atlas = "Pokedex2",
  blueprint_compat = true,
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
		return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, G.GAME.last_hand_played or "None"}}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint and card.ability.extra.last_hand ~= context.scoring_name then
        card.ability.extra.last_hand = G.GAME.last_hand_played
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT
        }
      end
      if context.joker_main then
        if card.ability.extra.mult > 0 then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end
  end,
}
-- Hoothoot 163
local hoothoot={
  name = "hoothoot",
  pos = {x = 1, y = 1},
  config = {extra = {scry = 3, chips = 30, rounds = 4}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue + 1] = {set = 'Other', key = 'scry_cards'}
		return {vars = {card.ability.extra.scry, card.ability.extra.chips, card.ability.extra.rounds}}
  end,
  rarity = 2,
  cost = 5,
  stage = "Basic",
  ptype = "Colorless",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
    return level_evo(self, card, context, "j_poke_noctowl")
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) + card.ability.extra.scry
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.scry_amount = math.max(0,(G.GAME.scry_amount or 0) - card.ability.extra.scry)
  end,
}
-- Noctowl 164
local noctowl={
  name = "noctowl",
  pos = {x = 2, y = 1},
  config = {extra = {scry = 5, chips = 50}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue + 1] = {set = 'Other', key = 'scry_cards'}
		return {vars = {card.ability.extra.scry, card.ability.extra.chips}}
  end,
  rarity = 3,
  cost = 8,
  stage = "One",
  ptype = "Colorless",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) + card.ability.extra.scry
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.scry_amount = math.max(0,(G.GAME.scry_amount or 0) - card.ability.extra.scry)
  end,
}
-- Ledyba 165
local ledyba={
  name = "ledyba",
  pos = {x = 3, y = 1},
  config = {extra = {chips = 80, rounds = 4}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.chips, card.ability.extra.rounds}}
  end,
  rarity = 1,
  cost = 3,
  stage = "Basic",
  ptype = "Grass",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and next(context.poker_hands['Two Pair']) then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
    return level_evo(self, card, context, "j_poke_ledian")
  end,
}
-- Ledian 166
local ledian={
  name = "ledian",
  pos = {x = 4, y = 1},
  config = {extra = {chips = 120}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.chips}}
  end,
  rarity = 2,
  cost = 6,
  stage = "One",
  ptype = "Grass",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and next(context.poker_hands['Two Pair']) then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
  end,
}
-- Spinarak 167
local spinarak={
  name = "spinarak",
  pos = {x = 5, y = 1},
  config = {extra = {mult = 10, rounds = 4}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.rounds}}
  end,
  rarity = 1,
  cost = 4,
  stage = "Basic",
  ptype = "Grass",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and next(context.poker_hands['Two Pair']) then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult,
        }
      end
    end
    return level_evo(self, card, context, "j_poke_ariados")
  end,
}
-- Ariados 168
local ariados={
  name = "ariados",
  pos = {x = 6, y = 1},
  config = {extra = {mult = 15, mult1 = 20}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.mult1}}
  end,
  rarity = 2,
  cost = 6,
  stage = "One",
  ptype = "Grass",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and next(context.poker_hands['Two Pair']) then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult,
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card and context.other_card.lucky_trigger then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult,
          card = context.other_card,
        }
      end
    end
  end,
}
-- Crobat 169
local crobat={
  name = "crobat", 
  pos = {x = 7, y = 1},
  config = {extra = {mult = 0, mult_mod = 1, chips = 0, chip_mod = 10, Xmult = 1, Xmult_mod = .1, money = 0, money_mod = 1}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.Xmult, center.ability.extra.Xmult_mod,                    center.ability.extra.money, center.ability.extra.money_mod}}
  end,
  rarity = "poke_safari", 
  cost = 10, 
  stage = "Two", 
  ptype = "Dark",
  atlas = "Pokedex2",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      local m_count = 0 
      local c_count = 0 
      local x_count = 0 
      local d_count = 0
      local enhanced = {}
      for k, v in ipairs(context.scoring_hand) do
          if v.config.center ~= G.P_CENTERS.c_base and not v.debuff then 
              enhanced[#enhanced+1] = v
              if v.config.center == G.P_CENTERS.m_mult or v.config.center == G.P_CENTERS.m_wild then
                m_count = m_count + 1
              end
              if v.config.center == G.P_CENTERS.m_bonus or v.config.center == G.P_CENTERS.m_stone then
                c_count = c_count + 1
              end
              if v.config.center == G.P_CENTERS.m_steel or v.config.center == G.P_CENTERS.m_glass then
                x_count = x_count + 1
              end
              if v.config.center == G.P_CENTERS.m_gold or v.config.center == G.P_CENTERS.m_lucky then
                d_count = d_count + 1
              end
              local enhancement_type = pseudorandom(pseudoseed('crobat'))
              if enhancement_type > .875 then v:set_ability(G.P_CENTERS.m_bonus, nil, true)
              elseif enhancement_type > .75 then v:set_ability(G.P_CENTERS.m_mult, nil, true)
              elseif enhancement_type > .625 then v:set_ability(G.P_CENTERS.m_wild, nil, true)
              elseif enhancement_type > .50 then v:set_ability(G.P_CENTERS.m_glass, nil, true)
              elseif enhancement_type > .375 then v:set_ability(G.P_CENTERS.m_steel, nil, true)
              elseif enhancement_type > .25 then v:set_ability(G.P_CENTERS.m_stone, nil, true)
              elseif enhancement_type > .125 then v:set_ability(G.P_CENTERS.m_gold, nil, true)
              else v:set_ability(G.P_CENTERS.m_lucky, nil, true)
              end
              G.E_MANAGER:add_event(Event({
                  func = function()
                      v:juice_up()
                      return true
                  end
              })) 
          end
      end

      if #enhanced > 0 then 
          if m_count > 0 then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod * m_count
          end
          if c_count > 0 then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod * c_count
          end
          if x_count > 0 then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod * x_count
          end
          if d_count > 0 then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod * d_count
          end
      end
    end
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize("poke_screech_ex"), 
          colour = G.C.BLACK,
          mult_mod = card.ability.extra.mult,
          chip_mod = card.ability.extra.chips,
          Xmult_mod = card.ability.extra.Xmult
        }
      end
    end
  end,
  calc_dollar_bonus = function(self, card)
    if card.ability.extra.money > 0 then
      return ease_poke_dollars(card, "crobat", card.ability.extra.money, true)
    end
	end
}
-- Chinchou 170
-- Lanturn 171
-- Pichu 172
local pichu={
  name = "pichu", 
  pos = {x = 0, y = 2},
  config = {extra={money = 10, Xmult_minus = 0.75, rounds = 2}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'baby'}
    return {vars = {center.ability.extra.money, center.ability.extra.Xmult_minus, center.ability.extra.rounds}}
  end,
  rarity = 1, 
  cost = 3,
  stage = "Baby", 
  ptype = "Lightning",
  atlas = "Pokedex2",
  blueprint_compat = false,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        faint_baby_poke(self, card, context)
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult_minus}}, 
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult_minus
        }
      end
    end
    return level_evo(self, card, context, "j_poke_pikachu")
  end,
  calc_dollar_bonus = function(self, card)
    return ease_poke_dollars(card, "pichu", card.ability.extra.money, true)
	end
}
-- Cleffa 173
local cleffa={
  name = "cleffa",
  pos = {x = 1, y = 2},
  config = {extra = {Xmult_minus = 0.75,rounds = 2,}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'baby'}
    info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
    info_queue[#info_queue+1] = G.P_CENTERS.c_moon
    return {vars = {center.ability.extra.Xmult_minus, center.ability.extra.rounds, }}
  end,
  rarity = 1,
  cost = 3,
  stage = "Baby",
  ptype = "Fairy",
  atlas = "Pokedex2",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        faint_baby_poke(self, card, context)
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult_minus}}, 
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult_minus
        }
      end
    end
    if context.end_of_round and not context.individual and not context.repetition then
      local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_moon')
      local edition = {negative = true}
      _card:set_edition(edition, true)
      _card:add_to_deck()
      G.consumeables:emplace(_card)
    end
    return level_evo(self, card, context, "j_poke_clefairy")
  end,
}
-- Igglybuff 174
local igglybuff={
  name = "igglybuff",
  pos = {x = 2, y = 2},
  config = {extra = {Xmult_minus = 0.75,rounds = 2,}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'baby'}
    info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
    info_queue[#info_queue+1] = G.P_CENTERS.c_world
    return {vars = {center.ability.extra.Xmult_minus, center.ability.extra.rounds, }}
  end,
  rarity = 1,
  cost = 3,
  stage = "Baby",
  ptype = "Colorless",
  atlas = "Pokedex2",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        faint_baby_poke(self, card, context) 
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult_minus}}, 
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult_minus
        }
      end
    end
    if context.end_of_round and not context.individual and not context.repetition then
      local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_world')
      local edition = {negative = true}
      _card:set_edition(edition, true)
      _card:add_to_deck()
      G.consumeables:emplace(_card)
    end
    return level_evo(self, card, context, "j_poke_jigglypuff")
  end,
}
-- Togepi 175
-- Togetic 176
-- Natu 177
-- Xatu 178
-- Mareep 179
-- Flaaffy 180

return {name = "Pokemon Jokers 151-180", 
        list = { mew, chikorita, bayleef, meganium, cyndaquil, quilava, typhlosion, totodile, croconaw, feraligatr, sentret, furret, hoothoot, noctowl, ledyba, ledian, spinarak, ariados, crobat, pichu, cleffa, igglybuff},
}
