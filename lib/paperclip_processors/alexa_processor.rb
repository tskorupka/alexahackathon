# ffmpeg -y -i 0.mp3 -ar 16000 -ab 48k -codec:a libmp3lame -ac 1 output.mp3
module Paperclip
  class AlexaProcessor < Processor
    def initialize(file, options = {}, attachment = nil)
      super

      # make the file and attachment accessible to the module and class
      @file = file
      @attachment = attachment

      # set some default parameters for basename, eventual file format
      @basename = File.basename(@file.path)
      @format = options[:format] || 'mp3'

      # -y is to allow ffmpeg to overwrite output without asking, and -i is to denote the input filename for the next argument
      @params = options[:params] || '-y -i'

      # set some default sample_rate and bit_rate which we will use for the conversion
      @sample_rate = options[:sample_rate] || "16000"
      @bit_rate = options[:bit_rate] || "48k"
    end

    def make
      source = @file
      output = Tempfile.new([@basename, ".#{@format}"])
      begin
        parameters = [@params, ':source', '-ar' ,'16000', '-ab', '48k', '-codec:a', 'libmp3lame', '-ac', '1', ':dest'].join(' ')
        Paperclip.run('ffmpeg', parameters, :source => File.expand_path(source.path), :dest => File.expand_path(output.path), :sample_rate => @sample_rate, :bit_rate => @bit_rate)
      rescue Exception => e
        puts e
        # raise PaperclipError, "There was an error converting #{@basename} to .mp3 [ALEXA AMAZON FORMAT]"
      end
      output
    end
  end
end
