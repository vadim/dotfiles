#!/usr/bin/env perl

use warnings;
use strict;

my @dotfiles = glob "*";

foreach my $file (@dotfiles) {
	next if $file =~ /.pl$/;
	next if $file =~ /.bash$/;
	next if $file =~ /tmux_completion/;

	my $ln_command = "ln -sf ~/dotfiles/$file ~/.$file";
	print "$ln_command\n" and system $ln_command;
}
