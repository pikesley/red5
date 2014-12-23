[![Build Status](https://travis-ci.org/pikesley/red5.svg)](https://travis-ci.org/pikesley/red5)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/red5.svg)](https://gemnasium.com/pikesley/red5)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/red5.svg)](https://coveralls.io/r/pikesley/red5)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/red5.svg)](https://codeclimate.com/github/pikesley/red5)
[![Gem Version](http://img.shields.io/gem/v/red5.svg)](https://rubygems.org/gems/red5)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

# Red5

Ruby bindings for the [Star Wars API](http://swapi.co)

    git clone https://github.com/pikesley/red5
    cd red5
    bundle
    rake

or just

    gem install red5

##API

I've followed the [Star Wars API](http://swapi.co/documentation#intro) as closely as I can. It's probably best illustrated with some examples from the [specs](https://github.com/pikesley/red5/tree/master/spec):

###Get a thing

    it 'finds a particular film', :vcr do
      film = Films.find 1
      expect(film['title']).to eq 'A New Hope'
      expect(film['episode_id']).to eq 4
    end

###Fetch the thing linked to by an attribute

    it 'fetches the species for a person', :vcr do
      person = People.find 15 # Greedo
      expect(person.fetch_species[0]['name']).to eq 'Rodian'
    end

##Exceptions

###Raise an exception on a 404

    it 'raises an exception on a non-existent thing', :vcr do
      expect{ Starships.find 999 }.to raise_exception do |exception|
        expect(exception).to be_a Red5Exception
        expect(exception.status).to eq 'Starship #999 does not exist'
      end
    end

###Raise an exception on a bogus lookup

    it 'raises an exception on a bogus lookup', :vcr do
      person = People.find 19
      expect{ person['favourite_food'] }. to raise_exception do |exception|
        expect(exception).to be_a Red5Exception
        expect(exception.status).to eq 'No such attribute favourite_food'
      end
    end

##Further work

This seems to cover the basics, what else should it do?
