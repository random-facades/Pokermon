
local cheri_berry = {
   name = 'cheri_berry',
   key = 'cheri_berry',
   set = 'Berry',
   pos = { x = 0, y = 0 },
   config = {max_highlighted = 2, suit_conv = 'Clubs'},
   loc_vars = function(self, info_queue, card)
      return {vars = {self.config.max_highlighted, localize(self.config.suit_conv, 'suits_plural'), colours = {G.C.SUITS[self.config.suit_conv]}}}
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   use = function(self, card, area, copier)
      for i=1, #G.hand.highlighted do
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
               G.hand.highlighted[i]:change_suit(card.ability.consumeable.suit_conv)
               return true
            end
         }))
      end
   end,
}


local chesto_berry = {
   name = 'chesto_berry',
   key = 'chesto_berry',
   set = 'Berry',
   pos = { x = 1, y = 0 },
   config = {max_highlighted = 2, suit_conv = 'Diamonds'},
   loc_vars = function(self, info_queue, card)
      return {vars = {self.config.max_highlighted, localize(self.config.suit_conv, 'suits_plural'), colours = {G.C.SUITS[self.config.suit_conv]}}}
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   use = function(self, card, area, copier)
      for i=1, #G.hand.highlighted do
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
               G.hand.highlighted[i]:change_suit(card.ability.consumeable.suit_conv)
               return true
            end
         }))
      end
   end,
}


local pecha_berry = {
   name = 'pecha_berry',
   key = 'pecha_berry',
   set = 'Berry',
   pos = { x = 2, y = 0 },
   config = {max_highlighted = 2, suit_conv = 'Hearts'},
   loc_vars = function(self, info_queue, card)
      return {vars = {self.config.max_highlighted, localize(self.config.suit_conv, 'suits_plural'), colours = {G.C.SUITS[self.config.suit_conv]}}}
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   use = function(self, card, area, copier)
      for i=1, #G.hand.highlighted do
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
               G.hand.highlighted[i]:change_suit(card.ability.consumeable.suit_conv)
               return true
            end
         }))
      end
   end,
}


local rawst_berry = {
   name = 'rawst_berry',
   key = 'rawst_berry',
   set = 'Berry',
   pos = { x = 3, y = 0 },
   config = {max_highlighted = 2, suit_conv = 'Spades'},
   loc_vars = function(self, info_queue, card)
      return {vars = {self.config.max_highlighted, localize(self.config.suit_conv, 'suits_plural'), colours = {G.C.SUITS[self.config.suit_conv]}}}
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   use = function(self, card, area, copier)
      for i=1, #G.hand.highlighted do
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
               G.hand.highlighted[i]:change_suit(card.ability.consumeable.suit_conv)
               return true
            end
         }))
      end
   end,
}


local aspear_berry = {
   name = 'aspear_berry',
   key = 'aspear_berry',
   set = 'Berry',
   pos = { x = 4, y = 0 },
   config = {max_highlighted = 3},
   loc_vars = function(self, info_queue, card)
      return {vars = {self.config.max_highlighted}}
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   use = function(self, card, area, copier)
      local suit_list = {}
      for name, _ in pairs(SMODS.Suits) do
         table.insert(suit_list, name)
      end
      local new_suit = pseudorandom_element(suit_list, pseudoseed('aspear'))
      for i=1, #G.hand.highlighted do
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
               G.hand.highlighted[i]:change_suit(new_suit)
               return true
            end
         }))
      end
   end,
}


local leppa_berry = {
   name = 'leppa_berry',
   key = 'leppa_berry',
   set = 'Berry',
   pos = { x = 5, y = 0 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local oran_berry = {
   name = 'oran_berry',
   key = 'oran_berry',
   set = 'Berry',
   pos = { x = 6, y = 0 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local persim_berry = {
   name = 'persim_berry',
   key = 'persim_berry',
   set = 'Berry',
   pos = { x = 7, y = 0 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local lum_berry = {
   name = 'lum_berry',
   key = 'lum_berry',
   set = 'Berry',
   pos = { x = 8, y = 0 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local sitrus_berry = {
   name = 'sitrus_berry',
   key = 'sitrus_berry',
   set = 'Berry',
   pos = { x = 9, y = 0 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local figy_berry = {
   name = 'figy_berry',
   key = 'figy_berry',
   set = 'Berry',
   pos = { x = 0, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local wiki_berry = {
   name = 'wiki_berry',
   key = 'wiki_berry',
   set = 'Berry',
   pos = { x = 1, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local mago_berry = {
   name = 'mago_berry',
   key = 'mago_berry',
   set = 'Berry',
   pos = { x = 2, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local aguav_berry = {
   name = 'aguav_berry',
   key = 'aguav_berry',
   set = 'Berry',
   pos = { x = 3, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local iapapa_berry = {
   name = 'iapapa_berry',
   key = 'iapapa_berry',
   set = 'Berry',
   pos = { x = 4, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local razz_berry = {
   name = 'razz_berry',
   key = 'razz_berry',
   set = 'Berry',
   pos = { x = 5, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local bluk_berry = {
   name = 'bluk_berry',
   key = 'bluk_berry',
   set = 'Berry',
   pos = { x = 6, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local nanab_berry = {
   name = 'nanab_berry',
   key = 'nanab_berry',
   set = 'Berry',
   pos = { x = 7, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local wepear_berry = {
   name = 'wepear_berry',
   key = 'wepear_berry',
   set = 'Berry',
   pos = { x = 8, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local pinap_berry = {
   name = 'pinap_berry',
   key = 'pinap_berry',
   set = 'Berry',
   pos = { x = 9, y = 1 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local pomeg_berry = {
   name = 'pomeg_berry',
   key = 'pomeg_berry',
   set = 'Berry',
   pos = { x = 0, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local kelpsy_berry = {
   name = 'kelpsy_berry',
   key = 'kelpsy_berry',
   set = 'Berry',
   pos = { x = 1, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local qualot_berry = {
   name = 'qualot_berry',
   key = 'qualot_berry',
   set = 'Berry',
   pos = { x = 2, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local hondew_berry = {
   name = 'hondew_berry',
   key = 'hondew_berry',
   set = 'Berry',
   pos = { x = 3, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local grepa_berry = {
   name = 'grepa_berry',
   key = 'grepa_berry',
   set = 'Berry',
   pos = { x = 4, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local tamato_berry = {
   name = 'tamato_berry',
   key = 'tamato_berry',
   set = 'Berry',
   pos = { x = 5, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local cornn_berry = {
   name = 'cornn_berry',
   key = 'cornn_berry',
   set = 'Berry',
   pos = { x = 6, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local magost_berry = {
   name = 'magost_berry',
   key = 'magost_berry',
   set = 'Berry',
   pos = { x = 7, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local rabuta_berry = {
   name = 'rabuta_berry',
   key = 'rabuta_berry',
   set = 'Berry',
   pos = { x = 8, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local nomel_berry = {
   name = 'nomel_berry',
   key = 'nomel_berry',
   set = 'Berry',
   pos = { x = 9, y = 2 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local spelon_berry = {
   name = 'spelon_berry',
   key = 'spelon_berry',
   set = 'Berry',
   pos = { x = 0, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local pamtre_berry = {
   name = 'pamtre_berry',
   key = 'pamtre_berry',
   set = 'Berry',
   pos = { x = 1, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local watmel_berry = {
   name = 'watmel_berry',
   key = 'watmel_berry',
   set = 'Berry',
   pos = { x = 2, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local durin_berry = {
   name = 'durin_berry',
   key = 'durin_berry',
   set = 'Berry',
   pos = { x = 3, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local belue_berry = {
   name = 'belue_berry',
   key = 'belue_berry',
   set = 'Berry',
   pos = { x = 4, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local occa_berry = {
   name = 'occa_berry',
   key = 'occa_berry',
   set = 'Berry',
   pos = { x = 5, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local passho_berry = {
   name = 'passho_berry',
   key = 'passho_berry',
   set = 'Berry',
   pos = { x = 6, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local wacan_berry = {
   name = 'wacan_berry',
   key = 'wacan_berry',
   set = 'Berry',
   pos = { x = 7, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local rindo_berry = {
   name = 'rindo_berry',
   key = 'rindo_berry',
   set = 'Berry',
   pos = { x = 8, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local yache_berry = {
   name = 'yache_berry',
   key = 'yache_berry',
   set = 'Berry',
   pos = { x = 9, y = 3 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local chople_berry = {
   name = 'chople_berry',
   key = 'chople_berry',
   set = 'Berry',
   pos = { x = 0, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local kebia_berry = {
   name = 'kebia_berry',
   key = 'kebia_berry',
   set = 'Berry',
   pos = { x = 1, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local shuca_berry = {
   name = 'shuca_berry',
   key = 'shuca_berry',
   set = 'Berry',
   pos = { x = 2, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local coba_berry = {
   name = 'coba_berry',
   key = 'coba_berry',
   set = 'Berry',
   pos = { x = 3, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local payapa_berry = {
   name = 'payapa_berry',
   key = 'payapa_berry',
   set = 'Berry',
   pos = { x = 4, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local tanga_berry = {
   name = 'tanga_berry',
   key = 'tanga_berry',
   set = 'Berry',
   pos = { x = 5, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local charti_berry = {
   name = 'charti_berry',
   key = 'charti_berry',
   set = 'Berry',
   pos = { x = 6, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local kasib_berry = {
   name = 'kasib_berry',
   key = 'kasib_berry',
   set = 'Berry',
   pos = { x = 7, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local haban_berry = {
   name = 'haban_berry',
   key = 'haban_berry',
   set = 'Berry',
   pos = { x = 8, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local colbur_berry = {
   name = 'colbur_berry',
   key = 'colbur_berry',
   set = 'Berry',
   pos = { x = 9, y = 4 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local babiri_berry = {
   name = 'babiri_berry',
   key = 'babiri_berry',
   set = 'Berry',
   pos = { x = 0, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local chilan_berry = {
   name = 'chilan_berry',
   key = 'chilan_berry',
   set = 'Berry',
   pos = { x = 1, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local liechi_berry = {
   name = 'liechi_berry',
   key = 'liechi_berry',
   set = 'Berry',
   pos = { x = 2, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local ganlon_berry = {
   name = 'ganlon_berry',
   key = 'ganlon_berry',
   set = 'Berry',
   pos = { x = 3, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local salac_berry = {
   name = 'salac_berry',
   key = 'salac_berry',
   set = 'Berry',
   pos = { x = 4, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local petaya_berry = {
   name = 'petaya_berry',
   key = 'petaya_berry',
   set = 'Berry',
   pos = { x = 5, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local apicot_berry = {
   name = 'apicot_berry',
   key = 'apicot_berry',
   set = 'Berry',
   pos = { x = 6, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local lansat_berry = {
   name = 'lansat_berry',
   key = 'lansat_berry',
   set = 'Berry',
   pos = { x = 7, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local starf_berry = {
   name = 'starf_berry',
   key = 'starf_berry',
   set = 'Berry',
   pos = { x = 8, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local enigma_berry = {
   name = 'enigma_berry',
   key = 'enigma_berry',
   set = 'Berry',
   pos = { x = 9, y = 5 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local micle_berry = {
   name = 'micle_berry',
   key = 'micle_berry',
   set = 'Berry',
   pos = { x = 0, y = 6 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local custap_berry = {
   name = 'custap_berry',
   key = 'custap_berry',
   set = 'Berry',
   pos = { x = 1, y = 6 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local jaboca_berry = {
   name = 'jaboca_berry',
   key = 'jaboca_berry',
   set = 'Berry',
   pos = { x = 2, y = 6 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local rowap_berry = {
   name = 'rowap_berry',
   key = 'rowap_berry',
   set = 'Berry',
   pos = { x = 3, y = 6 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local roseli_berry = {
   name = 'roseli_berry',
   key = 'roseli_berry',
   set = 'Berry',
   pos = { x = 4, y = 6 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local hopo_berry = {
   name = 'hopo_berry',
   key = 'hopo_berry',
   set = 'Berry',
   pos = { x = 5, y = 6 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local kee_berry = {
   name = 'kee_berry',
   key = 'kee_berry',
   set = 'Berry',
   pos = { x = 6, y = 6 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}


local maranga_berry = {
   name = 'maranga_berry',
   key = 'maranga_berry',
   set = 'Berry',
   pos = { x = 7, y = 6 },
   config = {max_highlighted = 1},
   loc_vars = function(self, info_queue, card)
   end,
   atlas = 'berries',
   cost = 3,
   unlocked = true,
   discovered = true,
   can_use = function(self, card)
      return true
   end,
   use = function(self, card, area, copier)
   end
}









return {name = "Berries",
        list = {cheri_berry, chesto_berry, pecha_berry, rawst_berry, aspear_berry, leppa_berry, oran_berry, persim_berry, lum_berry, sitrus_berry, figy_berry, 
        wiki_berry, mago_berry, aguav_berry, iapapa_berry, razz_berry, bluk_berry, nanab_berry, wepear_berry, pinap_berry, pomeg_berry, kelpsy_berry, qualot_berry, 
        hondew_berry, grepa_berry, tamato_berry, cornn_berry, magost_berry, rabuta_berry, nomel_berry, spelon_berry, pamtre_berry, watmel_berry, durin_berry, 
        belue_berry, occa_berry, passho_berry, wacan_berry, rindo_berry, yache_berry, chople_berry, kebia_berry, shuca_berry, coba_berry, payapa_berry, tanga_berry, 
        charti_berry, kasib_berry, haban_berry, colbur_berry, babiri_berry, chilan_berry, liechi_berry, ganlon_berry, salac_berry, petaya_berry, apicot_berry, 
        lansat_berry, starf_berry, enigma_berry, micle_berry, custap_berry, jaboca_berry, rowap_berry, roseli_berry, hopo_berry, kee_berry, maranga_berry}
}