# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def find_team(team_name)
  # Initialize team variable for which we are searching
  team = {}
  # Iterate through top level hash and find player_name
  game_hash.each_pair do |team_key, team_hash|
    return team_hash if team_hash[:team_name] == team_name
  end
  # If the team was not found, return a error messages
 "Sorry, that team name was not found, verify your input"
end

def find_player(player_name)
  # Initialize player variable for which we are searching
  player = {}
  # Iterate through top level hash
  game_hash.each_pair do |team_key, team_hash|
    # Iterate through :players array and find player_name
    player = team_hash[:players].find {|player_hash| player_hash[:player_name] == player_name}
    # If a player_name was found, return the player, otherwise continue iterating
    return player if  player
  end
  # If the player was not found, return a error messages
  "Sorry, that player name was not found, verify your input"
end

def num_points_scored(player_name)
  # Call find_player method then pull the :points scored from returned player
  find_player(player_name)[:points]
end

def shoe_size(player_name)
  # Call find_player method then pull the :shoe size from returned player
  find_player(player_name)[:shoe]
end

def team_colors(team_name)
  # Call find_team method then pull the :colors from returned player
  find_team(team_name)[:colors]
end

def team_names
  # Initialize team_names variable for which we are searching
  team_names = []
  # Iterate through top level hash
  game_hash.each_pair do |team_key, team_hash|
    # Collect team names into array :team_names
    team_names.push(team_hash[:team_name])
  end
  # Return team_names
  team_names
end

def player_numbers(team_name)
  # Call find_team method then map the :players key to only pull the player :numbers
  find_team(team_name)[:players].map {|player| player[:number]}
end

def player_stats(player_name)
  # Call find_player method
  find_player(player_name)
end

def big_shoe_rebounds
  # Initialize big_shoe_player variable for which we are searching
  big_shoe_player = []
  # Iterate through top level hash
  game_hash.each_pair do |team_key, team_hash|
    # Find maximum :shoe from each team and push it to big_shoe_player
    big_shoe_player.push(team_hash[:players].max_by {|player_hash| player_hash[:shoe]})
  end
  # Find gloabl maximum :shoe from big_shoe_player
  big_shoe_player = big_shoe_player.max_by {|player_hash| player_hash[:shoe]}
  # Return :rebounds of selected big_shoe_player
  big_shoe_player[:rebounds]
end

def most_points_scored
  # Initialize max_points_player variable for which we are searching
  max_points_player = []
  # Iterate through top level hash
  game_hash.each_pair do |team_key, team_hash|
    # Find maximum :points from each team and push it to max_points_player
    max_points_player.push(team_hash[:players].max_by {|player_hash| player_hash[:points]})
  end
  # Find gloabl maximum :points from max_points_player
  max_points_player = max_points_player.max_by {|player_hash| player_hash[:points]}
  # Return :player_name of selected max_points_player
  max_points_player[:player_name]
end

def winning_team
  # Initialize winning_team variable for which we are searching
  winner = {}
  # Iterate through top level hash
  game_hash.each_pair do |team_key, team_hash|
    # Sum up each teams :players :points assign the result as the value of winner with their team_name as key
    winner[team_hash[:team_name]] = team_hash[:players].sum {|player_hash| player_hash[:points]}
  end
  winner = winner.max_by {|team_name, points| points}
  winner[0]
end

def player_with_longest_name
  # Initialize long_name_player variable for which we are searching
  long_name_player = []
  # Iterate through top level hash
  game_hash.each_pair do |team_key, team_hash|
    # Find maximum :player_name.length from each team and push it to long_name_player
    long_name_player.push(team_hash[:players].max_by {|player_hash| player_hash[:player_name].length})
  end
  # Find gloabl maximum :player_name]length from long_name_player
  long_name_player = long_name_player.max_by {|player_hash| player_hash[:player_name].length}
  # Return :player_name of selected long_name_player
  long_name_player[:player_name]
end

def long_name_steals_a_ton?
  # Initialize most_steals_player variable for which we are searching
  most_steals_player =[]
  # Iterate through top level hash
  game_hash.each_pair do |team_key, team_hash|
    # Find maximum :points from each team and push it to most_steals_player
    most_steals_player.push(team_hash[:players].max_by {|player_hash| player_hash[:steals]})
  end
  # Find gloabl maximum :points from most_steals_player
  most_steals_player = most_steals_player.max_by {|player_hash| player_hash[:steals]}
  # Compare player_name of selected most_steals_player against that returned by method player_with_longest_name
  most_steals_player[:player_name] == player_with_longest_name
end