# Commit 1 - Pseudocode

# input: bloggers_information = [
#   [["James Spader"],["214.555.1357"],["123 N South St."],["Chicago"],["il"],["60645"],["@samspade"]],
#   [["Jenny Forrest"],["Schamberg"],["il"],["312-555-2244"],["@imaboat"]],
#   [["Jimmy Stuart"],["@getyerwings"],["313 555 9865"],["1128 Alameda Ave"],["Glendale"],["CA"],["92606"]],
#   [["Mountain Joe"],["3035550021"],["@campfire"]],
#   [["Mr. Henderson"],["312-555-9224"],["Chicago"],["il"],["60647"],["@hairy"]],
#   [["Nerf Herder"],["123 N South St."],["Chicago"],["il"],["60645"],["@blueharvest"],["310.555.2234"]]
# ]                        
# output: {"James Spader" => {phone => "214.555.1357", twitter => "@samspade"}, "Jenny Forrest" => {phone => "312-555-2244", twitter => "@imaboat"}, "Jimmy Stuart" =>{phone => "313 555 9865", twitter => "@getyerwings"}...


# create an output hash
# loop through the bloggers_information array
# grab the name and put it in the output hash as a key with a value of an empty hash
# loop through the other arrays in that array looking for phone number and twitter handle
# grab phone number and twitter handle using regex
# put the phone number and the twitter handle in the hash within the hash

# Commit 2 - Initial Solution

def collect_contact_info(data)
  parsed_contact_info = {}
  data.each do |person_attributes|
    parsed_contact_info[person_attributes[0][0]] = {}

    # find twitter and phone number
    person_attributes.each do |attribute|
      if attribute[0] =~ /@/
        parsed_contact_info[person_attributes[0][0]][:twitter] = attribute[0]
      end

      if !(attribute[0] =~ /[a-wz]/) && attribute[0].length > 5
        parsed_contact_info[person_attributes[0][0]][:phone] = attribute[0]
      end
    end 
  end 
  parsed_contact_info
end

# Commit 4 - Refactor Solution



# Commit 3 - Runner Code / Tests

# Don't touch the code under this line.
bloggers_information = [[["James Spader"],["214.555.1357"],["123 N South St."],["Chicago"],["il"],["60645"],["@samspade"]], [["Jenny Forrest"],["Schamberg"],["il"],["312-555-2244"],["@imaboat"]], [["Jimmy Stuart"],["@getyerwings"],["313 555 9865"],["1128 Alameda Ave"],["Glendale"],["CA"],["92606"]], [["Mountain Joe"],["3035550021"],["@campfire"]], [["Mr. Henderson"],["312-555-9224"],["Chicago"],["il"],["60647"],["@hairy"]], [["Nerf Herder"],["123 N South St."],["Chicago"],["il"],["60645"],["@blueharvest"],["310.555.2234"]]]
p collect_contact_info(bloggers_information)

bloggers_information_abridged = [[["James Spader"],["214.555.1357"],["123 N South St."],["Chicago"],["il"],["60645"],["@samspade"]], [["Jenny Forrest"],["Schamberg"],["il"],["312-555-2244"],["@imaboat"]], [["Jimmy Stuart"],["@getyerwings"],["313 555 9865"],["1128 Alameda Ave"],["Glendale"],["CA"],["92606"]]]
p collect_contact_info(bloggers_information_abridged) == {"James Spader" => {:phone => "214.555.1357", :twitter => "@samspade"}, "Jenny Forrest" => {:phone => "312-555-2244", :twitter => "@imaboat"}, "Jimmy Stuart" =>{:phone => "313 555 9865", :twitter => "@getyerwings"}}  # => true