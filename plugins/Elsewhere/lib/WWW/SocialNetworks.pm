package WWW::SocialNetworks;
use strict;
use base qw( Class::Accessor::Fast );

__PACKAGE__->mk_accessors( qw( type ) );

our %Networks = (
    '1upcom'    => [ '1up.com', 'http://%s.1up.com/' ],
    '43things'  => [ '43Things', 'http://www.43things.com/person/%s/' ],
    aim         => [ 'AIM', 'aim:goim?screenname=%s' ],
    yahoo       => [ 'Yahoo! Messenger', 'http://edit.yahoo.com/config/send_webmesg?.target=%s' ],
    skype       => [ 'Skype', 'callto://%s' ],
    msn         => [ 'MSN Messenger', 'msnim:chat?contact=%s' ],
    bebo        => [ 'Bebo', 'http://www.bebo.com/Profile.jsp?MemberId=%s' ],
    catster     => [ 'Catster', 'http://www.catster.com/cats/%s' ],
    delicious   => [ 'del.icio.us', 'http://del.icio.us/%s/' ],
    digg        => [ 'Digg', 'http://digg.com/users/%s/' ],
    dodgeball   => [ 'Dodgeball', 'http://www.dodgeball.com/user?uid=%s' ],
    dogster     => [ 'Dogster', 'http://www.dogster.com/dogs/%s' ],
    dopplr      => [ 'Dopplr', 'http://www.dopplr.com/traveller/%s/' ],
    facebook    => [ 'Facebook', 'http://www.facebook.com/profile.php?id=%s' ],
    flickr      => [ 'Flickr', 'http://flickr.com/photos/%s/' ],
    goodreads   => [ 'Goodreads', 'http://www.goodreads.com/user/show/%s' ],
    hi5         => [ 'Hi5', 'http://hi5.com/friend/profile/displayProfile.do?userid=%s' ],
    iconbuffet  => [ 'IconBuffet', 'http://www.iconbuffet.com/people/%s' ],
    icq         => [ 'ICQ', 'http://www.icq.com/people/about_me.php?uin=%s' ],
    iusethis    => [ 'IUseThis', 'http://osx.iusethis.com/user/%s' ],
    jaiku       => [ 'Jaiku', 'http://%s.jaiku.com/' ],
    lastfm      => [ 'Last.fm', 'http://www.last.fm/user/%s/' ],
    linkedin    => [ 'LinkedIn', 'http://www.linkedin.com/in/%s' ],
    livejournal => [ 'LiveJournal', 'http://%s.livejournal.com/' ],
    magnolia    => [ 'Ma.gnolia', 'http://ma.gnolia.com/people/%s' ],
    mog         => [ 'MOG', 'http://mog.com/%s' ],
    multiply    => [ 'Multiply', 'http://%s.multiply.com/' ],
    myspace     => [ 'MySpace', 'http://www.myspace.com/%s' ],
    newsvine    => [ 'Newsvine', 'http://%s.newsvine.com/' ],
    ning        => [ 'Ning', 'http://%s.ning.com/' ],
    ohloh       => [ 'Ohloh', 'http://ohloh.net/accounts/%s' ],
    orkut       => [ 'Orkut', 'http://www.orkut.com/Profile.aspx?uid=%s' ],
    pandora     => [ 'Pandora', 'http://pandora.com/people/%s' ],
    pownce      => [ 'Pownce', 'http://pownce.com/%s/' ],
    reddit      => [ 'Reddit', 'http://reddit.com/user/%s/' ],
    sonicliving => [ 'SonicLiving', 'http://www.sonicliving.com/user/%s/' ],
    steam       => [ 'Steam', 'http://steamcommunity.com/id/%s' ],
    stumbleupon => [ 'StumbleUpon', 'http://%s.stumbleupon.com/' ],
    tabblo      => [ 'Tabblo', 'http://www.tabblo.com/studio/person/%s/' ],
    technorati  => [ 'Technorati', 'http://technorati.com/people/technorati/%s' ],
    tribe       => [ 'Tribe', 'http://people.tribe.net/%s' ],
    twitter     => [ 'Twitter', 'http://twitter.com/%s' ],
    upcoming    => [ 'Upcoming', 'http://upcoming.yahoo.com/user/%s' ],
    virb        => [ 'Virb', 'http://www.virb.com/%s' ],
    vox         => [ 'Vox', 'http://%s.vox.com/' ],
    xboxlive    => [ 'Xbox Live', 'http://live.xbox.com/member/%s' ],
    youtube     => [ 'YouTube', 'http://www.youtube.com/user/%s' ],
    zooomr      => [ 'Zooomr', 'http://www.zooomr.com/photos/%s' ],
);

sub all {
    return \%Networks;
}

sub get {
    my $class = shift;
    my( $type ) = @_;
    my $network = $class->SUPER::new;
    $network->type( $type );
    return $network;
}

sub name { return $Networks{ shift->type }[ 0 ] }

sub uri_for {
    my $network = shift;
    my( $id ) = @_;
    return sprintf $Networks{ $network->type }[ 1 ], $id;
}

1;
