# best ones: 

# It picks up its ambiguity and continues to read.
# It shakes its gentrification.


require 'rubygems'
require 'engtagger'
require 'gingerice'
# require 'lingua/en/readability'
require 'twitter'
require 'active_support/inflector'
require './text'






contractions = {
  "aren't" => "are not",
  "can't" => "cannot",
  "couldn't" => "could not",
  "didn't" => "did not",
  "doesn't" => "does not",
  "don't" => "do not",
  "hadn't" => "had not",
  "hasn't" => "has not",
  "haven't" => "have not",
  "he'd" => "he had",
  "he'll" => "he will",
  "he's" => "he is",
  "it's" => "it is",
  "I'd" => "I had",
  "I'll" => "I will",
  "I'm" => "I am",
  "I've" => "I have",
  "isn't" => "is not",
  "let's" => "let us",
  "mightn't" =>  "might not",
  "mustn't" => "must not",
  "shan't" => "shall not",
  "she'd" => "she had",
  "she'll" => "she will",
  "she's" => "she is",
  "shouldn't" => "should not",
  "that's" => "that is",
  "there's" => "there is",
  "they'd" => "they had",
  "they'll" => "they will",
  "they're" => "they are",
  "they've" => "they have",
  "we'd" => "we had",
  "we're" => "we are",
  "we've" => "we have",
  "weren't" => "were not",
  "what'll" => "what will",
  "what're" => "what are",
  "what's" => "what is",
  "what've" => "what have",
  "where's" => "where is",
  "who'll" => "who will",
  "who're" => "who are",
  "who's" => "who is",
  "who've" => "who have",
  "won't" => "will not",
  "wouldn't" => "would not",
  "you'd" => "you had",
  "you'll" => "you will",
  "you're" => "you are",
  "you've" => "you have"
}






# tgr = EngTagger.new

# r_length = @text.length
# range = rand(r_length)
# text = @text[range, 10000]

# text.gsub!(/“|”|"/, '')

# text =  tgr.get_sentences(text).sample

# text = text.split(" ").map {|word| contractions[word] ? word = contractions[word] : word}.join(" ")


words = {
  verbs_infinitive: 
    [
      "celebrate", 
      "extrapolate",
      "negotiate",
      "articulate",
      "curate",
      "penetrate",
      "regenerate",
      "superimpose",

    ],
  verbs_present: ["kills", "shades", "poches"],
  adjectives: 
    [
      "diagramatic", 
      "brave", 
      "delightful", 
      "Miesian", 
      "modular",
      "parametric",
      "Post-Industrial",
      "rectilinear",
      "truncated",
      "vernacular",
      "dynamic",
      "formal",
      "proud",
      "banal",
      "bespoke",
      "blase",
      "contemporary",
      "eclectic",
      "ephemeral",
      "esoteric",
      "hybrid",
      "generative",
      "wholistic",
      "homogenous",
      "iconic",
      "interstitial",
      "kitsch",
      "liminal",
      "monolithic",
      "organic",
      "perfomative",
      "robust",
      "stereotomic",
      "transient",

    ],
  nouns: 
    [
      "arcade", 
      "blobitecture", 
      "structure", 
      "brutalism", 
      "building envelope", 
      "cantilever", 
      "charette", 
      "enfilade", 
      "ergonomy", 
      "exurbia", 
      "facade", 
      "fenestration", 
      "flaneur", 
      "Genius Loci", 
      "gentrification", 
      "massing", 
      "materiality", 
      "mullion",
      "muntin",
      "parti",
      "pastiche",
      "permaculture",
      "phenomenology",
      "pilotis",
      "poche",
      "program",
      "rebate",
      "regionalism",
      "skin",
      "stylobate",
      "sustainability",
      "threshold",
      "typology",
      "vault",
      "vernacular",
      "verticality",
      "walkability",
      "concept",
      "context",
      "device",
      "dimension",
      "elevation",
      "fabric",
      "gesture",
      "grain",
      "hierarchy",
      "language",
      "legibility",
      "metaphor",
      "moment",
      "node",
      "pod",
      "scale",
      "section",
      "space",
      "taxonomy",
      "adjacency",
      "aesthetic",
      "amalgamation",
      "ambiguity",
      "assemblage",
      "catalyst",
      "concretization",
      "confluence",
      "dichotomy",
      "dissonance",
      "domesticity",
      "duality",
      "gestalt",
      "hegemony",
      "inspiration",
      "iteration",
      "juxtaposition",
      "morphology",
      "motif",
      "nuance",
      "paradigm",
      "parallax",
      "procession",
      "redundancy",
      "schism",
      "sequence",
      "simultaneity",
      "stasis",
      "tectonics",
      "architectonics",
      "uniformity",
      "zeitgeist",

    ],
    proper_nouns: 
      [
        "Frank",
        "Lloyd",
        "Wright",
        "Ghery",
        "Zaha",
        "Hadid",
        "Corbusier",
        "Mies",
        "Renzo",
        "Piano",
        "Philip",
        "Johnson",
        "Louis",
        "Kahn",
        "Pei",
        "Antoni",
        "Gaudi",
        "Norman",
        "Foster",
        "Meier",
        "Rem",
        "Koolhaas",
        "Daniel",
        "Libeskind",
        "Walter",
        "Gropius",
        "Oscar",
        "Niemeyer",
        "Alvar",
        "Aalto",
        "Louis",
        "Sulivan",
        "Santiago",
        "Calatrava",
        "Tadao",
        "Ando",
        "Jean",
        "Nouvel",
        "Michael",
        "Graves",
        "Eero",
        "Saarinen",
        "Michelangelo",
        "Robert",
        "Venturi",
        "Cesar",
        "Pelli",
        "Buckminster",
        "Fuller",
        "Daniel",
        "Burnham",
        "Brunelleschi",
        "Eisenman",
        "Loos",

      ]
}

r_length = @text.length
range = rand(r_length)
text = @text[range, 10000]

class Text
  def initialize(text, contractions, words)
    @contractions = contractions
    @words = words
    @text = text
    @readable = ''
    @phrase = ''
    @parsed_text = []
    @tgr = make_tagger
    format_text
    create_sentences
    check_sentence
    swap_words
    build_phrase
  end

  def make_tagger
    EngTagger.new
  end

  def create_sentences
    @sentences =  @tgr.get_sentences(@text)
  end

  def pick_sentence
    @sentences.sample
  end

  def format_text
    @text.gsub!(/“|”|"/, '')
    @text = @text.split(" ").map {|word| @contractions[word] ? word = @contractions[word] : word}.join(" ")
  end

  def parse_text
    @readable = @tgr.get_readable(pick_sentence)
  end

  def map_pos
    @readable.split(" ").map do |labeled_text|
      labels = labeled_text.split('/')
      labeled = Hash.new
      labeled[labels[1]] = labels[0]
      @parsed_text << labeled
    end
  end

  def seed_sentence
    parse_text
    map_pos
  end

  def check_sentence
    seed_sentence
    while !optimal
      seed_sentence
    end
  end

  def optimal
    sentence_length = @parsed_text.length
    noun_count = 0.0
    @parsed_text.each do |labeled_word|
      labeled_word.each do |key, _|
        if key == "NN" || key == "NNS"
          noun_count += 1
        end
      end
    end
    noun_percentage = (noun_count/sentence_length) * 100
    if (noun_percentage < 40 && noun_percentage > 0) && (sentence_length > 4 && sentence_length < 20)
      true
    else
      @parsed_text = []
      @readable = ''
      false
    end
  end

  def swap_words
    # make_plural = -1
    @parsed_text.each do |labeled_word|
      labeled_word.each do |key, value|
        # if key == "PRP"
        #   new_word = "it"
        #   make_plural = 1
        # elsif key == "PRPS"
        #   new_word = "its"
        if key == "NN"
          new_word = @words[:nouns].sample
        elsif key == "NNS"
            new_word = @words[:nouns].sample.pluralize
        elsif key == "NNP"
          new_word = @words[:proper_nouns].sample
        # elsif key == "JJ"
        #   new_word = @words[:adjectives].sample
        end
        # if make_plural == 0
        #   if new_word
        #     p new_word = new_word.pluralize
        #   else
        #     if key != "PP" || key == "PPC"
        #       p new_word = value.pluralize
        #     end
        #   end
        #     make_plural = -1
        # end
        if new_word
          labeled_word[key] = new_word
        end
        # if make_plural > 0
        #   make_plural -= 1
        # end
        # p make_plural
      end
    end
  end

  def build_phrase
    @parsed_text.each do |labeled_text|
      labeled_text.each do |key, value|
        if key == "PP" || key == "PPC"
          @phrase.rstrip!
          @phrase += value + " "
        elsif key == "NNP"
          @phrase += value.capitalize + " "
        else
          @phrase += value + " "
        end
      end
    end
    if @phrase[0] =~ /[[:lower:]]/
      @phrase[0] = @phrase[0].upcase
    end
  end

  def phrase
    @phrase.rstrip
  end


end

text = Text.new(text, contractions, words)
client.update(text.phrase)
# parser = Gingerice::Parser.new
# text = parser.parse text.phrase
# p "*"*50
# p text["result"]





# readable = tgr.get_readable(text)
# parsed_text = []
# readable.split(" ").map do |labeled_text|
#   labels = labeled_text.split('/')
#   labeled = Hash.new
#   labeled[labels[1]] = labels[0]
#   parsed_text << labeled
# end


# parsed_text.each do |labeled_word|
#   p labeled_word
#   labeled_word.each do |key, value|
#     if key == "PRP"
#       labeled_word[key] = "it"
#     elsif key == "PRPS"
#       labeled_word[key] = "its"
#     elsif key == "NN"
#       labeled_word[key] = words[:nouns].sample
#     elsif key == "NNS"
#         labeled_word[key] = words[:nouns].sample.pluralize
#     elsif key == "NNP"
#       labeled_word[key] = words[:proper_nouns].sample
          
#     # elsif key == "VB"
#     #     labeled_word[key] = words[:verbs_infinitive].sample
#     # elsif key == "VBZ"
#     #     labeled_word[key] = words[:verbs_present].sample
#       elsif key == "JJ"
#         labeled_word[key] = words[:adjectives].sample
          
#     end
#   end
# end
# new_text = ""
# parsed_text.each do |labeled_text|
#   labeled_text.each do |key, value|
#     if key == "PP" || key == "PPC"
#       new_text.rstrip!
#       new_text += value + " "
#     elsif key == "NNP"
#       new_text += value.capitalize + " "
        
#     else
#       new_text += value + " "
#     end
#     # {|_, value| new_text += value + " "}
#   end
# end
# if new_text[0] =~ /[[:lower:]]/
#   new_text[0] = new_text[0].upcase
# end
# puts new_text.rstrip

