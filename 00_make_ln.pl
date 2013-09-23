#!/usr/bin/env perl

use warnings;
use strict;

my @dotfiles = glob "_*";

foreach my $file (@dotfiles) {
	my $file_sub;
	($file_sub = $file) =~ s/^_/\./;

	my $ln_command = "ln -sf ~/dotfiles/$file ~/$file_sub";
	print "$ln_command\n" and system $ln_command;
}
