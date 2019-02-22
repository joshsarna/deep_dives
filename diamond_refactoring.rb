# Diamond Refactoring

#Commit 3 - Refactor Solution

def diamond_printer(word)
  message = word.split("")
  array = []

  characters_list = {
                     "A" => 1, 
                     "B" => 2, 
                     "C" => 3, 
                     "D" => 4, 
                     "E" => 5, 
                     "F" => 6, 
                     "G" => 7, 
                     "H" => 8, 
                     "I" => 9, 
                     "J" => 10, 
                     "K" => 11, 
                     "L" => 12, 
                     "M" => 13, 
                     "N" => 14, 
                     "O" => 15, 
                     "P" => 16, 
                     "Q" => 17, 
                     "R" => 18, 
                     "S" => 19, 
                     "T" => 20, 
                     "U" => 21, 
                     "V" => 22, 
                     "W" => 23, 
                     "X" => 24, 
                     "Y" => 25, 
                     "Z" => 26
                     }

  message.each do |l|
    upcased_l = l.upcase  # upcase so that capitals and lowercase are treated the same
    if upcased_l.count("A-Z") == 0
      array << [upcased_l]
    else
      word_array = [] # This represents a single diamond, corresponding to one letter; letter_array might be a better name, or diamond_array
      characters_list.each_key do |c| # What is c?
        upcased_c = c.upcase

        if characters_list[upcased_c] > characters_list[upcased_l]
          break
        end

        if characters_list[upcased_c] == 1
          line = " " * (characters_list[upcased_l] * 2 - 1)
          middle = line.length / 2 
          line[middle] = "A"
          word_array << line
        else
          line = " " * (characters_list[upcased_l] * 2 - 1)
          middle = line.length / 2
          placement_1 = middle - (characters_list[upcased_c] - 1)
          placement_2 = middle + (characters_list[upcased_c] - 1)
          line[placement_1] = upcased_c
          line[placement_2] = upcased_c
          word_array << line
        end
      end

      word_array += word_array[0..-2].reverse
      array << word_array
    end
  end
  array.flatten!.join("\n") + "\n"
end


#Commit 2 - Write Runner Code / Tests


p diamond_printer("ace") == "A\n  A  \n B B \nC   C\n B B \n  A  \n    A    \n   B B   \n  C   C  \n D     D \nE       E\n D     D \n  C   C  \n   B B   \n    A    \n"
p "========================="
p diamond_printer("ghost") == "      A      \n     B B     \n    C   C    \n   D     D   \n  E       E  \n F         F \nG           G\n F         F \n  E       E  \n   D     D   \n    C   C    \n     B B     \n      A      \n       A       \n      B B      \n     C   C     \n    D     D    \n   E       E   \n  F         F  \n G           G \nH             H\n G           G \n  F         F  \n   E       E   \n    D     D    \n     C   C     \n      B B      \n       A       \n              A              \n             B B             \n            C   C            \n           D     D           \n          E       E          \n         F         F         \n        G           G        \n       H             H       \n      I               I      \n     J                 J     \n    K                   K    \n   L                     L   \n  M                       M  \n N                         N \nO                           O\n N                         N \n  M                       M  \n   L                     L   \n    K                   K    \n     J                 J     \n      I               I      \n       H             H       \n        G           G        \n         F         F         \n          E       E          \n           D     D           \n            C   C            \n             B B             \n              A              \n                  A                  \n                 B B                 \n                C   C                \n               D     D               \n              E       E              \n             F         F             \n            G           G            \n           H             H           \n          I               I          \n         J                 J         \n        K                   K        \n       L                     L       \n      M                       M      \n     N                         N     \n    O                           O    \n   P                             P   \n  Q                               Q  \n R                                 R \nS                                   S\n R                                 R \n  Q                               Q  \n   P                             P   \n    O                           O    \n     N                         N     \n      M                       M      \n       L                     L       \n        K                   K        \n         J                 J         \n          I               I          \n           H             H           \n            G           G            \n             F         F             \n              E       E              \n               D     D               \n                C   C                \n                 B B                 \n                  A                  \n                   A                   \n                  B B                  \n                 C   C                 \n                D     D                \n               E       E               \n              F         F              \n             G           G             \n            H             H            \n           I               I           \n          J                 J          \n         K                   K         \n        L                     L        \n       M                       M       \n      N                         N      \n     O                           O     \n    P                             P    \n   Q                               Q   \n  R                                 R  \n S                                   S \nT                                     T\n S                                   S \n  R                                 R  \n   Q                               Q   \n    P                             P    \n     O                           O     \n      N                         N      \n       M                       M       \n        L                     L        \n         K                   K         \n          J                 J          \n           I               I           \n            H             H            \n             G           G             \n              F         F              \n               E       E               \n                D     D                \n                 C   C                 \n                  B B                  \n                   A                   \n"
p "========================="
p diamond_printer("De Beers") == "   A   \n  B B  \n C   C \nD     D\n C   C \n  B B  \n   A   \n    A    \n   B B   \n  C   C  \n D     D \nE       E\n D     D \n  C   C  \n   B B   \n    A    \n \n A \nB B\n A \n    A    \n   B B   \n  C   C  \n D     D \nE       E\n D     D \n  C   C  \n   B B   \n    A    \n    A    \n   B B   \n  C   C  \n D     D \nE       E\n D     D \n  C   C  \n   B B   \n    A    \n                 A                 \n                B B                \n               C   C               \n              D     D              \n             E       E             \n            F         F            \n           G           G           \n          H             H          \n         I               I         \n        J                 J        \n       K                   K       \n      L                     L      \n     M                       M     \n    N                         N    \n   O                           O   \n  P                             P  \n Q                               Q \nR                                 R\n Q                               Q \n  P                             P  \n   O                           O   \n    N                         N    \n     M                       M     \n      L                     L      \n       K                   K       \n        J                 J        \n         I               I         \n          H             H          \n           G           G           \n            F         F            \n             E       E             \n              D     D              \n               C   C               \n                B B                \n                 A                 \n                  A                  \n                 B B                 \n                C   C                \n               D     D               \n              E       E              \n             F         F             \n            G           G            \n           H             H           \n          I               I          \n         J                 J         \n        K                   K        \n       L                     L       \n      M                       M      \n     N                         N     \n    O                           O    \n   P                             P   \n  Q                               Q  \n R                                 R \nS                                   S\n R                                 R \n  Q                               Q  \n   P                             P   \n    O                           O    \n     N                         N     \n      M                       M      \n       L                     L       \n        K                   K        \n         J                 J         \n          I               I          \n           H             H           \n            G           G            \n             F         F             \n              E       E              \n               D     D               \n                C   C                \n                 B B                 \n                  A                  \n"

