module FelyneBot
	module Commands
		module NewGuild
			extend Discordrb::Commands::CommandContainer
			command(
					:newguild,
					description: "Adds a user guild to the guilds database.",
					usage: "newguild <GuildName>",
					min_args: 1,
					max_args: 1,
					permission_level: 800,
					permission_message: "Talk to Reaver01 if you have a new guild you would like added to the server."
			) do |event, search, server|
				role = event.bot.server(122526505606709257).roles.find { |role| role.name == search }
				if role == nil
					event.respond "The role **#{search}** does not exist on the server. Please create it before running the command again."
				else
					tempGuilds= Guilds.new(role.id, search, server, $guilds, event.message.channel, $bot)
					saveGuilds($guilds,"userbase/guilds")
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: newguild <#{search}>"
				nil
			end
		end
	end
end