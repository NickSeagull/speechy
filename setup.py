from distutils.core import setup
setup(
    name = 'speechy',
    packages = ['speechy'],
    install_requires = ['hy>=0.10.0'],
    version = '0.1',
    license = "MIT",
    package_data = {
        'speechy': ['*.hy'],
    },
    description = 'A TDD/BDD framework for Hy',
    author = 'Nikita Tchayka',
    author_email = 'nikitatchayka@gmail.com',
    url = 'https://github.com/nickseagull/speechy',
    download_url = 'https://github.com/nickseagull/speechy/tarball/0.1',
    keywords = ['testing', 'tdd', 'bdd', 'spec', 'hy', 'hylang'],
    classifiers = [
        "Development Status :: 1 - Planning",
        "Environment :: Console",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Natural Language :: English",
        "Operating System :: OS Independent",
        "Programming Language :: Python",
        "Topic :: Software Development :: Quality Assurance",
        "Topic :: Software Development :: Testing",
        "Topic :: Utilities",
    ],
)
