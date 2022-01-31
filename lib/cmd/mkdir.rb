class Mkdir

  class Errors
    def self.null_opts
      Glob.white "No directory name specified."
    end
  end

  def self.call(opts=["mkdir"])
    opts.shift

    if opts.length == 0:
      puts Errors.null_opts
    else if opts.length == 1:
      if opts[0].length == 0
  end
end
