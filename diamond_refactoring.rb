# Diamond Refactoring

#Commit 3 - Refactor Solution

def letter_to_number(letter)
  letter.ord - 64
end

def number_to_letter(number)
  (number + 64).chr
end

def diamond_printer(word)
  message = word.split("")
  array = []

  message.each do |l|
    upcased_l = l.upcase  # upcase so that capitals and lowercase are treated the same
    l_as_number = letter_to_number(upcased_l)

    if l_as_number > 26 || l_as_number < 1
      array << [upcased_l]
    else
      word_array = [] # This represents a single diamond, corresponding to one letter; letter_array might be a better name, or diamond_array
      i = 0
      i_as_letter = ""
      while i_as_letter != upcased_l
        i += 1
        i_as_letter = number_to_letter(i)

        if i == 1
          line = " " * (l_as_number * 2 - 1)
          middle = line.length / 2 
          line[middle] = "A"
          word_array << line
        else
          line = " " * (l_as_number * 2 - 1)
          middle = line.length / 2
          placement_1 = middle - (i - 1)
          placement_2 = middle + (i - 1)
          line[placement_1] = i_as_letter
          line[placement_2] = i_as_letter
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

