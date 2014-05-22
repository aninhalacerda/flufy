models = File.join(File.dirname(__FILE__), 'models') # path to your models
$LOAD_PATH << File.expand_path(models)

# Constent Missing for requiring models files
def Object.const_missing(const)
	binding.pry
    require const.to_s.underscore
    klass = const_get(const)
    return klass if klass
end