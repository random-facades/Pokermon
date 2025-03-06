-- Dhelmise 781
-- Jangmo-o 782
-- Hakamo-o 783
-- Kommo-o 784
-- Tapu Koko 785
-- Tapu Lele 786
-- Tapu Bulu 787
-- Tapu Fini 788
-- Cosmog 789
-- Cosmoem 790
-- Solgaleo 791
-- Lunala 792
-- Nihilego 793
-- Buzzwole 794
-- Pheromosa 795
-- Xurkitree 796
-- Celesteela 797
-- Kartana 798
-- Guzzlord 799
-- Necrozma 800
-- Magearna 801
-- Marshadow 802
local marshadow = {
  name = "marshadow",
  pos = { x = 5, y = 8 },
  soul_pos = { x = 6, y = 8 },
  config = { extra = {beaten_blinds = {}} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return { vars = {  } }
  end,
  rarity = 4,
  cost = 20,
  stage = "Legendary",
  ptype = "Fighting",
  atlas = "Pokedex7",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end,
}
-- Poipole 803
-- Naganadel 804
-- Stakataka 805
-- Blacephalon 806
-- Zeraora 807
-- Meltan 808
-- Melmetal 809
-- Grookey 810
return {
  name = "Pokemon Jokers 781-810",
  list = {marshadow},
}
