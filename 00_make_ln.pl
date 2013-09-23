#!/usr/bin/env perl

use warnings;
use strict;

use 5.010;

my @dotfiles = glob "_*";

foreach my $file (@dotfiles) {
	my $file_sub;
	($file_sub = $file) =~ s/^_/\./;

	my $ln_command = "ln -sf ~/dotfiles/$file ~/$file_sub";
	say $ln_command and system $ln_command;
}
