Pod::Spec.new do |s|
        s.name         = 'LanguagesManager'
        s.version = '0.0.1'
        s.requires_arc = true
        s.author = {
                'Morissard Jérome' => 'morissardj@gmail.com'
        }
        s.ios.deployment_target = '4.3'
        s.summary = 'LanguagesManager is a dymanic way to change localization dynamically. '
        s.license      = { :type => 'MIT' }
        s.homepage = 'https://github.com/leverdeterre/LanguagesManager'
        s.source = {
        :git => 'https://github.com/leverdeterre/LanguagesManager.git',
        :tag => "0.0.3"
        }
        s.source_files = 'LanguagesManager/LanguagesManager/LanguagesManager/*'
end
