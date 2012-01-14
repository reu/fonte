# Fonte
Fonte is a Valve Source engine log parser. Currently supporting only the basic HL Engine commands.

More info can be found at [HL Engine Log Standard documentation](https://developer.valvesoftware.com/wiki/HL_Log_Standard)

[![Build Status](https://secure.travis-ci.org/reu/fonte.png)](http://travis-ci.org/reu/fonte)

## Examples

Fonte comes with a bunch of parsers that can be used individually. Also, there is the `LogParser` which will then includes all the other `*Parser` to parse a full log file.

For example, if you wish to parse only a player informaton, you could use the PlayerParser:

```ruby
player = Fonte::Parsers::PlayerParser.new.parse("Reu<2><STEAM_1:1:24968171><Red>")

player.nickname.value                   # => "Reu"
player.steam_id.value                   # => "STEAM_1:1:24968171"
player.steam_id.account_number.value    # => 24968171
player.team.value                       # => "Red"
```

Another case is parsing a rcon authentication individually and within a log:

```ruby
rcon_parser = Fonte::Parsers::RconParser.new
rcon_authentication = rcon_parser.parse('Rcon: "rcon challenge "super secret" command" from "192.168.10.1:17015"')
rcon_authentication.password.value      # => "super secret"

log_parser = Fonte::Parsers::LogParser.new
log = log_parser.parse('L 12/26/2011 - 02:14:33: Rcon: "rcon challenge "super secret" command" from "192.168.10.1:17015"')
log.command.password.value              # => "super secret"
log.date_time.day                       # => 26
```

## Disclaimer

This is a very early approach and can be a considered a proof of concept in the current version. Lots of things should (and will) be changed. For instance, I am not quite happy with the forced _".value"_ API, but for now, it was the easiest way to implement. Also, it doesn't support real games log yet, so, there should be a way to easily "plug" specific game "log commands".
