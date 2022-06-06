use integer;

print "Convert a BMP to a Rem-Pac tileset. Input a 256x256 BMP in 24-bit named rempac.BMP.\n\n";
open INPUT, "rempac.bmp";
binmode INPUT;
read INPUT, $_, 0x36;

my $font;

# Read the whole BMP in a string.
for($j=0; $j<256; $j++)
{
	my @temp_line_array;
	
	for($i=0; $i<256; $i++)
	{
		read INPUT, $_, 3;
		my ($b,$g,$r) = unpack "CCC", $_;

		substr($font, ($i+$j*256)*3, 3) = chr($r).chr($g).chr($b);
	}
}
close INPUT;

# Flip it (because BMP are stored bottom-up)
for($j=0; $j<256/2; $j++)
{
	my $temp = substr($font, $j*256*3, 256*3);
	substr($font, $j*256*3, 256*3) = substr($font, (255-$j)*256*3, 256*3);
	substr($font, (255-$j)*256*3, 256*3) = $temp;
}

my $x = 0;
my $y = 0;

# Extract up to 64 tiles
for($c=0; $c<64; $c++)
{
	# Extract the first tile
	printf "	dw ";
	for($j=0; $j<8; $j++)
	{
		my $temp_number = 0;
		for($i=0; $i<8; $i++)
		{
			my $basepos = ($i+$x+($j+$y)*256)*3;
			
			my $r = ord(substr($font, $basepos, 1));
			my $g = ord(substr($font, $basepos+1, 1));
			my $b = ord(substr($font, $basepos+2, 1));
			
			my $color = int(($r + $g + $b)/3);
			
			if($color > 80)
			{
				$temp_number += 1<<(7-$i);
			}
		}	
		
		printf "%03i",$temp_number;
		if($j == 7)
		{
			printf "  ; tile %i (address: %i)\n", $c, $c*8
		}
		else
		{
			printf ",";
		}	
	}
	
	$x += 8;
	if($x == 256)
	{
		$x = 0;
		$y += 8;
	}
}	
