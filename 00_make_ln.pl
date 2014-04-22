#!/usr/bin/env perl

use warnings;
use strict;

my @dotfiles = glob "*";

foreach my $file (@dotfiles) {
	next if $file =~ m/.pl$/;
	my $ln_command = "ln -sf ~/dotfiles/$file ~/.$file";
	print "$ln_command\n" and system $ln_command;
}
