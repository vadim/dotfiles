#!/usr/bin/env perl

use warnings;
use strict;
use v5.10;

my @dotfiles = glob "*";

foreach my $file (@dotfiles) {
	next if $file =~ /.pl$/;
	next if $file =~ /.bash$/;
	next if $file =~ /tmux_completion/;
	next if $file =~ /conda/;

	my $ln_command = "ln -sf ~/dotfiles/$file ~/.$file";
	say "$ln_command" and system $ln_command;
}
