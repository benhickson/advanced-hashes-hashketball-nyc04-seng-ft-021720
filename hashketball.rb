# Write your code here!

def game_hash
  the_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black','White'],
      players: [
        {
          player_name: 'Alan Anderson',
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
          player_name: 'Reggie Evans',
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
          player_name: 'Brook Lopez',
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
          player_name: 'Mason Plumlee',
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
          player_name: 'Jason Terry',
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
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise','Purple'],
      players: [
        {
          player_name: 'Jeff Adrien',
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
          player_name: 'Bismack Biyombo',
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
          player_name: 'DeSagna Diop',
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
          player_name: 'Ben Gordon',
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
          player_name: 'Kemba Walker',
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
  
  the_hash
end

def num_points_scored(player_name)
  game_hash.each do |team|
    team[1][:players].each do |player|
      if player[:player_name] == player_name
        return player[:points]
      end
    end
  end
  return 'Player not found.'
end

def shoe_size(player_name)
  game_hash.each do |team|
    team[1][:players].each do |player|
      if player[:player_name] == player_name
        return player[:shoe]
      end
    end
  end
  return 'Player not found.'
end

def team_colors(team_name)
  game_hash.each do |team|
    if team[1][:team_name] == team_name
      return team[1][:colors]
    end
  end
  return 'Team not found.'
end

def team_names
  output = []
  game_hash.each do |team|
    output.push(team[1][:team_name])
  end
  output
end

def player_numbers(team_name)
  output = []
  game_hash.each do |team|
    if team[1][:team_name] == team_name
      team[1][:players].each do |player|
        output.push(player[:number])
      end
    end
  end
  if output.length > 0
    output.sort
    return output
  else
    return 'Team not found.'
  end
end

def player_stats(player_name)
  game_hash.each do |team|
    team[1][:players].each do |player|
      if player[:player_name] == player_name
        return player.reject { |k,v| k == :player_name }
      end
    end
  end
  return 'Player not found.'
end

def big_shoe_rebounds
  hash = game_hash
  max_shoe = 0
  
  hash.each do |team|
    team[1][:players].each do |player|
      max_shoe = max_shoe > player[:shoe] ? max_shoe : player[:shoe]
    end
  end
  
  hash.each do |team|
    team[1][:players].each do |player|
      if player[:shoe] == max_shoe
        return player[:rebounds]
      end
    end
  end  
  
end

def most_points_scored
  hash = game_hash
  max_points = 0
  
  hash.each do |team|
    team[1][:players].each do |player|
      max_points = max_points > player[:points] ? max_points : player[:points]
    end
  end
  
  hash.each do |team|
    team[1][:players].each do |player|
      if player[:points] == max_points
        return player[:player_name]
      end
    end
  end  
  
end

def winning_team
  hash = game_hash
  home_points = 0
  away_points = 0
  
  counter = 1
  hash.each do |team|
    team[1][:players].each do |player|
      if counter <= 5
        home_points += player[:points]
      else
        away_points += player[:points]
      end
      counter += 1
    end
  end
  
  if home_points > away_points 
    return hash[:home][:team_name]
  else
    return hash[:away][:team_name]
  end
end

def player_with_longest_name
  hash = game_hash
  max_name_length = 0
  
  hash.each do |team|
    team[1][:players].each do |player|
      max_name_length = max_name_length > player[:player_name].length ? max_name_length : player[:player_name].length
    end
  end
  
  hash.each do |team|
    team[1][:players].each do |player|
      if player[:player_name].length == max_name_length
        return player[:player_name]
      end
    end
  end  
end

def long_name_steals_a_ton?
  hash = game_hash
  max_steals = 0
  
  hash.each do |team|
    team[1][:players].each do |player|
      max_steals = max_steals > player[:steals] ? max_steals : player[:steals]
    end
  end
  
  hash.each do |team|
    team[1][:players].each do |player|
      if player[:steals] == max_steals
        p 'checking'
        player_with_max_steals = player[:player_name]
      end
    end
  end
  
  player_with_max_steals == player_with_longest_name
end

long_name_steals_a_ton?


















