pseudorandom_multi = function(args)
  --Args: array(table), amt(num), seed(string), add_con(function), mod_func(function)
  local elements = {}
  local result = {}
  if args.array then
    for i = 1, #args.array do
      if not args.add_con or args.add_con(args.array[i]) then
        elements[#elements+1] = args.array[i]
      end
    end
    pseudoshuffle(elements, args.seed and pseudoseed(args.seed) or pseudoseed('default'))
    local amt = args.amt and math.min(#elements, args.amt) or #elements
    for j = 1, amt do
      if args.mod_func then
        args.mod_func(elements[j])
      end
      result[#result+1] = elements[j]
    end
  end
  return result
end

juice_flip = function(card, second)
  local sound = 'card1'
  local base_percent = 1.15
  local extra = nil
  if second then sound = 'tarot2' end
  if second then base_percent = 0.85 end
  if second then extra = .6 end
  G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
      play_sound('tarot1')
      card:juice_up(0.3, 0.5)
      return true end }))
  for i=1, #G.hand.highlighted do
      local percent = nil
      if second then
        percent = base_percent + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
      else
        percent = base_percent - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
      end
      G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound(sound, percent, extra);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true      end }))
  end
  delay(0.2)
end

juice_flip_hand = function(card, second)
  local sound = 'card1'
  local base_percent = 1.15
  local extra = nil
  if second then sound = 'tarot2' end
  if second then base_percent = 0.85 end
  if second then extra = .6 end
  G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
      play_sound('tarot1')
      card:juice_up(0.3, 0.5)
      return true end }))
  for i=1, #G.hand.cards do
      local percent = nil
      if second then
        percent = base_percent + (i-0.999)/(#G.hand.cards-0.998)*0.3
      else
        percent = base_percent - (i-0.999)/(#G.hand.cards-0.998)*0.3
      end
      G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound(sound, percent, extra);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
  end
  delay(0.2)
end

juice_flip_table = function(card, targets, second, limit)
  local sound = 'card1'
  local base_percent = 1.15
  local extra = nil
  if not limit then limit = #targets end
  if second then sound = 'tarot2' end
  if second then base_percent = 0.85 end
  if second then extra = .6 end
  G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
      play_sound('tarot1')
      card:juice_up(0.3, 0.5)
      return true end }))
  for i=1, limit do
      local percent = nil
      if second then
        percent = base_percent + (i-0.999)/(#targets-0.998)*0.3
      else
        percent = base_percent - (i-0.999)/(#targets-0.998)*0.3
      end
      G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() targets[i]:flip();play_sound(sound, percent, extra);targets[i]:juice_up(0.3, 0.3);return true end }))
  end
  delay(0.2)
end

juice_flip_single = function(card, index)
  G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
          play_sound('tarot1')
          card:juice_up(0.3, 0.5)
          return true
      end
  }))
  local percent = 1.15 - (index - 0.999) / (#G.hand.cards - 0.998) * 0.3
  G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
          card:flip(); play_sound('card1', percent); card:juice_up(0.3, 0.3); return true
      end
  }))
end

poke_add_card = function(add_card, card, area)
      if not area then area = G.hand end
      add_card:add_to_deck()
      G.deck.config.card_limit = G.deck.config.card_limit + 1
      table.insert(G.playing_cards, add_card)
      area:emplace(add_card)
      add_card.states.visible = nil
      G.E_MANAGER:add_event(Event({
        func = function()
            add_card:start_materialize()
            return true
        end
      })) 
      playing_card_joker_effects({add_card})
      return {
          message = localize('k_copied_ex'),
          colour = G.C.CHIPS,
          card = card,
          playing_cards_created = {true}
      }
end

poke_add_shop_card = function(add_card, card)
    add_card.states.visible = false
    G.shop_jokers:emplace(add_card)
    add_card:start_materialize()
    add_card:set_cost()
    create_shop_card_ui(add_card)
    
    if (SMODS.Mods["Talisman"] or {}).can_load then
      if Talisman.config_file.disable_anims then 
        add_card.states.visible = true
      end
    end
    card:juice_up()
    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('poke_plus_shop'), colour = G.C.GREEN})
end

poke_remove_card = function(target, card)
      if target.ability.name == 'Glass Card' then 
          target.shattered = true
      else 
          target.destroyed = true
      end 
      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true end }))
      G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.2,
          func = function() 
              if target.ability.name == 'Glass Card' then 
                  target:shatter()
              else
                  target:start_dissolve()
              end
          return true end }))
      delay(0.3)
      for i = 1, #G.jokers.cards do
          G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = {target}})
      end
      card:juice_up()
end

poke_debug = function(message, verbose, depth)
  if verbose then
    sendDebugMessage("The type of the message variable is ["..type(message).."]")
  end
  if type(message) == "table" then
    if depth then
      sendDebugMessage(inspectDepth(message))
    else
      sendDebugMessage(inspect(message))
    end
  else
    sendDebugMessage(message)
  end
end 

poke_vary_rank = function(card, decrease, seed)
  if not card.base or not card.base.value or not card.base.suit or not SMODS.Ranks[card.base.value] then return end
  local rank = SMODS.Ranks[card.base.value]
  seed = seed or 'poke_vary_rank'

  local next_rank = nil
  if decrease == nil then
    local poss_ranks = {}
    for _, v in pairs(G.P_CARDS) do
      if v.suit == card.base.suit then
        table.insert(poss_ranks, v.value)
      end
    end
    next_rank = pseudorandom_element(poss_ranks, pseudoseed(seed))
    print("poke_vary_rank (RANDOM) - ", card.base.value, next_rank)
  else
    next_rank = decrease and rank.prev or rank.next
    print("poke_vary_rank (UP/DOWN) - ", card.base.value, next_rank)
    if #next_rank == 1 then
      next_rank = next_rank[1]
    else
      next_rank = pseudorandom_element(next_rank, pseudoseed(seed))
      print("poke_vary_rank (UP/DOWN) - ", next_rank)
    end
  end
  G.E_MANAGER:add_event(Event({
      func = function()
          SMODS.change_base(card, nil, next_rank)
          return true
      end
  })) 
end

poke_create_base_copy = function(selected)
  for j = 1, 2 do
    create_playing_card({front = selected.config.card, center = G.P_CENTERS.c_base}, G.hand, nil, nil, {G.C.PURPLE})
  end
end

poke_get_adjacent_jokers = function(card)
  local jokers = {}
  if #G.jokers.cards > 1 then
    local pos = 0
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] == card then
        pos = i
        break
      end
    end
    if pos > 1 and G.jokers.cards[pos-1] then 
      table.insert(jokers, G.jokers.cards[pos-1])
    end
    if pos < #G.jokers.cards and G.jokers.cards[pos+1] then 
      table.insert(jokers, G.jokers.cards[pos+1])
    end
  end
  return jokers
end

poke_next_highest_rank = function(id, rank)
  local owned_ranks = {}
  for _, v in pairs(G.playing_cards) do
    if v.base and v.base.value then
      owned_ranks[v.base.value] = true
    end
  end

  local curr_rank = rank
  local found_next_rank = nil
  while not found_next_rank do
    local next_ranks = SMODS.Ranks[curr_rank].next or {}
    curr_rank = next_ranks[1]

    -- if there's nothing next (probably broke something) or we've looped a round, then fail out
    if not curr_rank or curr_rank == rank then
      found_next_rank = rank
    elseif owned_ranks[curr_rank] then
      found_next_rank = curr_rank
    end
  end
  found_next_rank = found_next_rank or rank
  return SMODS.Ranks[found_next_rank].id, found_next_rank
end

poke_lowest_rank = function(id, rank)
  local owned_ranks = {}
  for _, v in pairs(G.playing_cards) do
    if v.base and v.base.value then
      owned_ranks[v.base.value] = true
    end
  end

  local curr_rank = rank
  local found_prev_rank = nil
  while not found_prev_rank do
    local prev_ranks = SMODS.Ranks[curr_rank].prev or {}
    curr_rank = prev_ranks[1]

    -- if there's nothing previously (probably broke something) or we've looped a round, then fail out
    if not curr_rank or curr_rank == rank then
      found_prev_rank = rank
    elseif owned_ranks[curr_rank] then
      found_prev_rank = curr_rank
    end
  end
  found_prev_rank = found_prev_rank or rank
  return SMODS.Ranks[found_prev_rank].id, found_prev_rank
end

set_spoon_item = function(card)
  G.E_MANAGER:add_event(Event({
    trigger = 'immediate',
    func = function()
      G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          G.GAME.last_poke_item = card.config.center_key
            return true
        end
      }))
        return true
    end
  }))
end

poke_conversion_event_helper = function(func, delay, immediate)
  if immediate then
    func()
  else
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = delay or 0.1,
      func = function()
        func()
        return true
      end
    }))
  end
end

poke_convert_cards_to = function(cards, t, noflip, immediate)
  if cards and cards.is and cards:is(Card) then cards = {cards} end
  if not t.seal and not noflip then
    for i = 1, #cards do
      poke_conversion_event_helper(function() cards[i]:flip(); cards[i]:juice_up(0.3, 0.3) end)
    end
    delay(0.2)
  end
  for i = 1, #cards do
    if t.mod_conv then
      poke_conversion_event_helper(function() cards[i]:set_ability(G.P_CENTERS[t.mod_conv]) end, nil, immediate)
    end
    if t.edition then
      poke_conversion_event_helper(function() cards[i]:set_edition(t.edition, true) end, nil, immediate)
    end
    if t.suit_conv then
      poke_conversion_event_helper(function() cards[i]:change_suit(t.suit_conv) end, nil, immediate)
    end
    if t.seal then
      poke_conversion_event_helper(function() cards[i]:set_seal(t.seal, nil, true) end, nil, immediate)
    end
    if t.random then
      poke_conversion_event_helper(function()
        local poss_bases = {}
        for _, v in pairs(G.P_CARDS) do
          if v.base and v.base.suit == cards[i].base.suit then
            table.insert(poss_bases, v)
          end
        end
        cards[i]:set_base(pseudorandom_element(poss_bases, pseudoseed('random_rank')))
      end, nil, immediate)
    end
    if t.up or t.down then
      poke_conversion_event_helper(function()
        local curr_rank = SMODS.Ranks[cards[i].base.value]
        local next_rank = pseudorandom_element(t.up and curr_rank.next or curr_rank.prev, pseudoseed('random_rank'))
        assert(SMODS.change_base(cards[i], nil, next_rank.key))
      end, nil, immediate)
    end
    if t.bonus_chips then
      local bonus_add = function()
        cards[i].ability.perma_bonus = cards[i].ability.perma_bonus or 0
        cards[i].ability.perma_bonus = cards[i].ability.perma_bonus + t.bonus_chips
      end
      poke_conversion_event_helper(bonus_add, nil, immediate)
    end
  end
  if not t.seal and not noflip then
    for i = 1, #cards do
      poke_conversion_event_helper(function() cards[i]:flip(); cards[i]:juice_up(0.3, 0.3) end, 0.2)
    end
  end
  if not noflip then delay(0.3) end
  if noflip then
    for i = 1, #cards do
      poke_conversion_event_helper(function() cards[i]:juice_up(0.3, 0.3) end, 0.2)
    end
  end
  if cards == G.hand.highlighted then
    poke_conversion_event_helper(function() G.hand:unhighlight_all() end)
  end
end

poke_unhighlight_cards = function()
  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.2,
    func = function()
        G.hand:unhighlight_all(); return true
    end
  }))
end

local game_init_object = Game.init_game_object
function Game:init_game_object()
  local game = game_init_object(self)
  game.joker_rate = game.joker_rate + 8
  return game
end

poke_is_in_collection = function(card)
  if G.your_collection then
    for k, v in pairs(G.your_collection) do
      if card.area == v then
        return true
      end
    end
  end
  return false
end

tdmsg = function(tablename)
  if tablename and type(tablename) == "table" then
    sendDebugMessage(inspect(tablename))
  else
    sendDebugMessage("Not a table, Function: tdmsg")
  end
end