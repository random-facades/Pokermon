local jd_def = JokerDisplay.Definitions


--	Chikorita
--	Bayleef
--	Meganium
--	Cyndaquil
jd_def["j_poke_cyndaquil"] = { 
text = {
    { text = "+" },
    { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
},
text_config = { colour = G.C.MULT },
calc_function = function(card)
card.joker_display_values.mult = card.ability.extra.mult * G.GAME.current_round.discards_left
end
}

--	Quilava
jd_def["j_poke_quilava"] = { 
text = {
    { text = "+" },
    { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
},
text_config = { colour = G.C.MULT },
calc_function = function(card)
card.joker_display_values.mult = card.ability.extra.mult * G.GAME.current_round.discards_left
end
}

--	Typhlosion
jd_def["j_poke_typhlosion"] = { 
    text = {
        { text = "+", colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
        {text = " "},
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "Xmult", retrigger_type = "exp" }
            },
            border_colour = G.C.MULT
        }
    },
    text_config = { colour = G.C.WHITE },
    calc_function = function(card)
    card.joker_display_values.mult = card.ability.extra.mult * G.GAME.current_round.discards_left
    card.joker_display_values.Xmult = 1 + (card.ability.extra.Xmult * G.GAME.current_round.discards_left)
    end
}

--	Totodile
jd_def["j_poke_totodile"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
    },
text_config = { colour = G.C.CHIPS },
}

--	Croconaw
jd_def["j_poke_croconaw"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
    },
text_config = { colour = G.C.CHIPS },
}

--	Feraligatr
jd_def["j_poke_feraligatr"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
    },
text_config = { colour = G.C.CHIPS },
}

--	Sentret
jd_def["j_poke_sentret"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
    },
    reminder_text = {
        {text = "Last Played: "},
        {ref_table = "card.ability.extra", ref_value = "last_hand" }
    },
    text_config = { colour = G.C.MULT },
}

--	Furret
jd_def["j_poke_furret"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
    },
    reminder_text = {
        {text = "Last Played: "},
        {ref_table = "card.ability.extra", ref_value = "last_hand" }
    },
    text_config = { colour = G.C.MULT },
}

--	Hoothoot
-- jd_def["j_poke_hoothoot"] = { 
--     text = {
--         { text = "+" },
--         { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
--     },
--     text_config = { colour = G.C.CHIPS },
-- calc_function = function(card)
--     local chips = 0
--     if G.scry_view then
--         for k, v in pairs(G.scry_view.cards) do
--             local total_chips = poke_total_chips(v)
--             chips = chips + total_chips
--         end
--         card.joker_display_values.chips = chips
--     else
--         card.joker_display_values.chips = 0
--     end
-- end
--}

--	Noctowl
--	Ledyba
jd_def["j_poke_ledyba"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    calc_function = function(card)
    card.joker_display_values.mult = card.ability.extra.mult * math.floor(#G.deck.cards/4)
    end

}

--	Ledian
jd_def["j_poke_ledian"] = { 
text = {
    { text = "+" },
    { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
},
text_config = { colour = G.C.MULT },
calc_function = function(card)
card.joker_display_values.mult = card.ability.extra.mult * math.floor(#G.deck.cards/2)
end

}

--	Spinarak
jd_def["j_poke_spinarak"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
    },
text_config = { colour = G.C.CHIPS },
}

--	Ariados
jd_def["j_poke_ariados"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
    },
text_config = { colour = G.C.CHIPS },
}

--	Crobat
--	Chinchou
--	Lanturn
--	Pichu
jd_def["j_poke_pichu"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult_minus", retrigger_type = "exp" },
            },
        },
    },
}

--	Cleffa
jd_def["j_poke_cleffa"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult_minus", retrigger_type = "exp" },
            },
        },
    },
}

--	Igglybuff
jd_def["j_poke_igglybuff"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult_minus", retrigger_type = "exp" },
            },
        },
    },
}

--	Togepi
--	Togetic
--	Natu
--	Xatu
--	Mareep
--	Flaaffy
--	Ampharos
--	Bellossom
--	Marill
--	Azumarill
--	Sudowoodo
--	Politoed
--	Hoppip
--	Skiploom
--	Jumpluff
--	Aipom
--	Sunkern
--	Sunflora
--	Yanma
--	Wooper
--	Quagsire
--	Espeon
jd_def["j_poke_espeon"] = { 
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "Xmult", retrigger_type = "exp" },
            },
        },
    },
    reminder_text = {
        {ref_table = "card.joker_display_values", ref_value = "rank"},
        {text = " of "},
        {ref_table = "card.joker_display_values", ref_value = "suit"}
    },
    calc_function = function(card)
        local rank = G.GAME.current_round.espeon_rank
        local suit = G.GAME.current_round.espeon_suit
        local count = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit(suit) then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.Xmult = 1 * (card.ability.extra.Xmult_multi^count)
        card.joker_display_values.rank = localize(rank or "2", 'ranks')
        card.joker_display_values.suit = localize(suit or "Spades", 'suits_plural')
    end,
        retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
            local rank = G.GAME.current_round.espeon_rank
            if held_in_hand then return 0 end
            return (playing_card:get_id() == rank) and
                joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card) or 1
        end
}

--	Umbreon
jd_def["j_poke_umbreon"] = { 
    text = {
        {ref_table = "card.joker_display_values", ref_value = "hand", colour = G.C.GREY}
},
    reminder_text = {
        {ref_table = "card.ability.extra", ref_value = "decreases", colour = G.C.ORANGE},
        {text = " "},
        {text = "["},
        {ref_table = "card.ability.extra", ref_value = "decrease_goal"},
        {text = "]"},



    },
    calc_function = function(card)
        card.joker_display_values.hand = localize(card.ability.extra.hand_played, 'poker_hands')
end
}
--	Murkrow
--	Slowking
jd_def["j_poke_slowking"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult_multi", retrigger_type = "exp" },
            },
        },
    },
}

--	Misdreavus
jd_def["j_poke_misdreavus"] = { 
text = {
    { text = "+" },
    { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
},
text_config = { colour = G.C.CHIPS },
}

--	Unown
--	Wobbuffet
jd_def["j_poke_wobbuffet"] = {
reminder_text = {
    { ref_table = "card.joker_display_values", ref_value = "localized_text" }
},
calc_function = function(card)
    card.joker_display_values.localized_text = "(6,7,8,9,10)"
end,
retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
    if held_in_hand then return 0 end
    return (playing_card:get_id() == 6 or playing_card:get_id() == 7 or
            playing_card:get_id() == 8 or playing_card:get_id() == 9 or playing_card:get_id() == 10) and
        joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card) or 0
end
}

--	Girafarig
jd_def["j_poke_girafarig"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
            }
        }
    },
    text_config = { colour = G.C.WHITE },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local face_cards = {}
        if text == 'Two Pair' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:is_face() then
                    table.insert(face_cards, scoring_card)
                end
            end
        end
        local first_face = JokerDisplay.calculate_leftmost_card(face_cards)
        local last_face = JokerDisplay.calculate_rightmost_card(face_cards)
        card.joker_display_values.x_mult = math.max(last_face and
            (card.ability.extra.Xmult_multi ^ (JokerDisplay.calculate_card_triggers(last_face, scoring_hand) + (JokerDisplay.calculate_card_triggers(first_face, scoring_hand)))) or 1)

    end
}



--	Pineco
jd_def["j_poke_pineco"] = { 
text = {
    { text = "+" },
    { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
},
text_config = { colour = G.C.CHIPS },
calc_function = function(card)
local count = 0
local pos = 0

-- Check if `G.jokers.cards` exists and has more than one card
if G.jokers and G.jokers.cards and #G.jokers.cards > 1 then
    -- Find the position of the card
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            pos = i
            break
        end
    end

    -- Count the cards matching the specific conditions before `pos`
    for i = 1, pos - 1 do
        local joker_card = G.jokers.cards[i]
        if joker_card and joker_card.config and joker_card.config.center and
           joker_card.config.center.volatile and
           joker_card.config.center.config and joker_card.config.center.config.extra and
           joker_card.config.center.config.extra.volatile == 'left' then
            count = count + 1
        end
    end

    -- Set `x_mult` based on the condition
    if count == pos - 1 then
        card.joker_display_values.chips = card.ability.extra.chips or 1
    else
        card.joker_display_values.chips = 0
    end
else
    -- Handle cases where there are not enough jokers
    card.joker_display_values.chips = card.ability.extra.chips
end

-- Update `joker_display_values` with count and pos
card.joker_display_values.count = count
card.joker_display_values.pos = pos
end

}

--	Forretress
jd_def["j_poke_forretress"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
    },
text_config = { colour = G.C.CHIPS },
calc_function = function(card)
    local count = 0
    local pos = 0

    -- Check if `G.jokers.cards` exists and has more than one card
    if G.jokers and G.jokers.cards and #G.jokers.cards > 1 then
        -- Find the position of the card
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                pos = i
                break
            end
        end

        -- Count the cards matching the specific conditions before `pos`
        for i = 1, pos - 1 do
            local joker_card = G.jokers.cards[i]
            if joker_card and joker_card.config and joker_card.config.center and
               joker_card.config.center.volatile and
               joker_card.config.center.config and joker_card.config.center.config.extra and
               joker_card.config.center.config.extra.volatile == 'left' then
                count = count + 1
            end
        end

        -- Set `x_mult` based on the condition
        if count == pos - 1 then
            card.joker_display_values.chips = card.ability.extra.chips or 1
        else
            card.joker_display_values.chips = 0
        end
    else
        -- Handle cases where there are not enough jokers
        card.joker_display_values.chips = card.ability.extra.chips
    end

    -- Update `joker_display_values` with count and pos
    card.joker_display_values.count = count
    card.joker_display_values.pos = pos
end

}

--	Dunsparce
--	Gligar
--	Steelix
--	Snubbull
--	Granbull
--	Qwilfish
jd_def["j_poke_qwilfish"] = {
    text = {
        { text = "+", colour = G.C.CHIPS},
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS }
    },
}

--	Scizor
jd_def["j_poke_scizor"] = { 
    text = {
        { text = "+",  colour = G.C.CHIPS },
        { ref_table = "card.ability.extra", ref_value = "scizor_chips", retrigger_type = "mult",  colour = G.C.CHIPS  },
        {text = " "},
        { text = "+",  colour = G.C.MULT },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult",  colour = G.C.MULT  },
        {text = " "},
        {
            border_nodes = {
                { text = "X", colour = G.C.WHITE  },
                { ref_table = "card.ability.extra", ref_value = "scizor_Xmult", colour = G.C.WHITE }
            },
        },
    },

}

--	Shuckle
--	Heracross
--	Sneasel
--	Teddiursa
--	Ursaring
--	Slugma
--	Magcargo
--	Swinub
--	Piloswine
--	Corsola
--	Remoraid
--	Octillery
--	Delibird
--	Mantine
jd_def["j_poke_mantine"] = { 
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.CHIPS },
    }

--	Skarmory
jd_def["j_poke_skarmory"] = { 
    text = {
        {
            border_nodes = {
                { text = "X", colour = G.C.WHITE  },
                { ref_table = "card.joker_display_values", ref_value = "Xmult", colour = G.C.WHITE }
            },
        },
    },
    calc_function = function(card)
        local playing_hand = next(G.play.cards)
        local count = 0
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_hand or not playing_card.highlighted then
                if playing_card.facing and not (playing_card.facing == 'back') and not playing_card.debuff and SMODS.has_enhancement(playing_card, "m_poke_hazard") then
                    count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                end
            end
        end
        card.joker_display_values.Xmult = 1 + (count * card.ability.extra.Xmult_mod)
    end
}

--	Houndour
--	Houndoom
--	Kingdra
jd_def["j_poke_kingdra"] = { 
    text = {
        { text = "+" ,
        colour = G.C.MULT},
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult", 
        colour = G.C.MULT},
        {text = " "},
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult" }
            },
            border_colour = G.C.MULT
        }
    },
}


--	Phanpy
jd_def["j_poke_phanpy"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
            },
        },
    },
}

--	Donphan
jd_def["j_poke_donphan"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
            },
        },
    },
}

--	Porygon2
--	Stantler
--	Smeargle
--	Tyrogue
jd_def["j_poke_tyrogue"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult_minus", retrigger_type = "exp" },
            },
        },
    },
}

--	Hitmontop
jd_def["j_poke_hitmontop"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
            },
        },
    },
}

--	Smoochum
jd_def["j_poke_smoochum"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult_minus", retrigger_type = "exp" },
            },
        },
    },
}

--	Elekid
jd_def["j_poke_elekid"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult_minus", retrigger_type = "exp" },
            },
        },
    },
}

--	Magby
jd_def["j_poke_magby"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult_minus", retrigger_type = "exp" },
            },
        },
    },
}

--	Miltank
--	Blissey
--	Raikou
--	Entei
--	Suicune
--	Larvitar
--	Pupitar
--	Tyranitar
--	Lugia
--	Ho-oh
--	Celebi







