package OpenAI::API::Request::Edit;

use strict;
use warnings;

use Moo;
use strictures 2;
use namespace::clean;

extends 'OpenAI::API::Request';

use Types::Standard qw(Bool Str Num Int Map);

has model       => ( is => 'rw', isa => Str, required => 1, );
has instruction => ( is => 'rw', isa => Str, required => 1, );

has input       => ( is => 'rw', isa => Str, );
has temperature => ( is => 'rw', isa => Num, );
has top_p       => ( is => 'rw', isa => Num, );
has n           => ( is => 'rw', isa => Int, );

sub endpoint { 'edits' }
sub method   { 'POST' }

1;

__END__

=head1 NAME

OpenAI::API::Request::Edit - edits endpoint

=head1 SYNOPSIS

    use OpenAI::API::Request::Edit;

    my $request = OpenAI::API::Request::Edit->new(
        model       => "text-davinci-edit-001",
        input       => "What day of the wek is it?",
        instruction => "Fix the spelling mistakes",
    );

    # NOTE: the "/edits" endpoint is currently broken

    #my $res = $request->send();
    #
    #my $text = $res->{choices}[0]{text};

=head1 DESCRIPTION

Creates a new edit for the provided input, instruction, and parameters.

=head1 METHODS

=head2 new()

=over 4

=item * model

ID of the model to use. You can use the text-davinci-edit-001 or
code-davinci-edit-001 model with this endpoint.

=item * input [optional]

The input text to use as a starting point for the edit.

=item * instruction

The instruction that tells the model how to edit the prompt.

=item * n [optional]

How many edits to generate for the input and instruction.

=item * temperature [optional]

What sampling temperature to use, between 0 and 2.

=item * top_p [optional]

An alternative to sampling with temperature.

=back

=head2 send()

Sends the request and returns a data structured similar to the one
documented in the API reference.

=head2 send_async()

Send a request asynchronously. Returns a L<Promises> promise that will
be resolved with the decoded JSON response. See L<OpenAI::API::Request>
for an example.

=head1 SEE ALSO

OpenAI API Reference: L<Edits|https://platform.openai.com/docs/api-reference/edits>
