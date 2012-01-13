module Fonte
  module Nodes
    autoload :IntegerNode,         "fonte/nodes/integer_node"
    autoload :SingleWordNode,      "fonte/nodes/single_word_node"
    autoload :DateTimeNode,        "fonte/nodes/date_time_node"
    autoload :IpNode,              "fonte/nodes/ip_node"
    autoload :SteamIDNode,         "fonte/nodes/steam_id_node"
    autoload :BlankSteamIDNode,    "fonte/nodes/blank_steam_id_node"
    autoload :PendingSteamIDNode,  "fonte/nodes/pending_steam_id_node"
    autoload :InvalidSteamIDNode,  "fonte/nodes/invalid_steam_id_node"
    autoload :BotSteamIDNode,      "fonte/nodes/bot_steam_id_node"
    autoload :SteamIDUniverseNode, "fonte/nodes/steam_id_universe_node"
    autoload :RconCommandNode,     "fonte/nodes/rcon_command_node"
  end
end
