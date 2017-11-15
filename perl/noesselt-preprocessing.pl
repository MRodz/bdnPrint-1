#!/usr/bin/env perl

use autodie;
use strict;
use utf8;
use warnings;

use File::Slurp;

my $head = "";

my $tail = read_file("tmp/tmp-1.tex");



# specific processing for Noesselt
# wrong whitespaces
$tail =~ s/c\[II\], c\} /c\[II\], c\}/g;
$tail =~ s/\\sym\{\} \\p\{\}\{\\tfx\\high\{c\}\} \\\{\\persIndex\{Heynatz,/\\sym\{\}\\p\{\}\{\\tfx\\high\{c\}\} \\\{\\persIndex\{Heynatz,/g;
$tail =~ s/\\high\{\/ac\}\} \\marking\[oddHeader\]\{Vorreden\}/\\high\{\/ac\}\}\\marking\[oddHeader\]\{Vorreden\}/g;
$tail =~ s/\\high\{c\}\}\{c\} \\marking\[oddHeader\]\{Vorreden\}/\\high\{c\}\}\{c\}\\marking\[oddHeader\]\{Vorreden\}/g;
$tail =~ s/a\[I\]\} \\marking\[oddHeader\]\{Vorreden\}/a\[I\]\}\\marking\[oddHeader\]\{Vorreden\}/g;
$tail =~ s/ \\marking\[oddHeader\]\{Vorreden/\\marking\[oddHeader\]\{Vorreden/g;
$tail =~ s/\{b\[II\]\} \{\\tfx\\high\{ac\\textbackslash\}\}/\{b\[II\]\}\{\\tfx\\high\{ac\\textbackslash\}\}/g;
$tail =~ s/Werke, \\margin\{\}\{plClose\}/Werke,\\margin\{\}\{plClose\}/g;
$tail =~ s/\\crlf 1818\.\\stopalignment\}\\margin\{\}\{pb\}\{\}\{\\vl\}\{c\[II\]\} \\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}/\\crlf 1818\.\\stopalignment\}\\margin\{\}\{pb\}\{\}\{\\vl\}\{c\[II\]\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}/g;
$tail =~ s/30\.\\cNote\{30\} f\./30\.\\cNote\{30\}f\./g;
$tail =~ s/S\. 3 f\.\) Auch in/S\. 3f\.\) Auch in/g;
$tail =~ s/,\}\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}/,\} \\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}/g;
$tail =~ s/\}\~([^\\\{]{1})/\} $1/g;
$tail =~ s/ ([?,\.\:\;\)]{1})/$1/g;
$tail =~ s/,([\w]{1})/, $1/g;
$tail =~ s/, \\margin\{\}\{pl/,\\margin\{\}\{pl/g;
$tail =~ s/Kanzelberedtsamkeit\. Marburg 1812\. /Kanzelberedtsamkeit\. Marburg 1812\./g;
$tail =~ s/S\.\\italic\{Ueber/S\. \\italic\{Ueber/g;
$tail =~ s/1783\., und\\sym\{\}\\margin\{\}\{pb\}\{\}\{\\vl\}\{c134\}\\margin/1783\., und \\\\\\sym\{\}\\margin\{\}\{pb\}\{\}\{\\vl\}\{c134\} \\margin/g;
$tail =~ s/J\. C\. G\. Ackermann\}\\margin/J\. C\. G\. Ackermann\} \\margin/g;
$tail =~ s/\{\/a\} \\margin\{\}\{e\}/\{\/a\}\\margin\{\}\{e\}/g;


# wrong indentation
$tail =~ s/dazu eignete.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/dazu eignete.\\par /g;
$tail =~ s/zu lassen\?\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/zu lassen\?\\par /g;
$tail =~ s/schuldig.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/schuldig.\\par /g;
$tail =~ s/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\] Die kritischen/ Die kritischen/g;
$tail =~ s/Werth hat.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/Werth hat.\\par /g;
$tail =~ s/in Folgendem.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/in Folgendem.\\par /g;
$tail =~ s/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\] Die Schriften selbst/ Die Schriften selbst/g;
$tail =~ s/fortarbeiten.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/fortarbeiten.\\par /g;
$tail =~ s/Gelegenheit geben.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/Gelegenheit geben.\\par /g;
$tail =~ s/Einschaltungen erlaubt.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/Einschaltungen erlaubt.\\par /g;
$tail =~ s/Verfassers unterschieden.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/Verfassers unterschieden.\\par /g;
$tail =~ s/erschienen ist.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/erschienen ist.\\par /g;
$tail =~ s/a234\} \\margin/a234\}\\margin/g;

# wrong scribal abbreviations
$tail =~ s/\\margin\{kxXzHQaW\}\{omOpen\}\{d1e77096\}\{\\tfx\\high\{\/a\}\}\{\/a\}\\margindata\[inouter\]\{\/a\}\\writetolist\[section\]\{\}\{Vierter Abschnitt. \\italic\{Schöne Wissenschaften\}\}/\\writetolist\[section\]\{\}\{Vierter Abschnitt. \\italic\{Schöne Wissenschaften\}\}/g;
$tail =~ s/\\crlf Schöne Wissenschaften.\}\}\\margin\{aYNgpFkj\}\{omClose\}\{d1e77096\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}\\margindata\[inouter\]\{a\\textbackslash\}/\\crlf Schöne Wissenschaften.\\margin\{aYNgpFkj\}\{omClose\}\{d1e77096\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}\\margindata\[inouter\]\{a\\textbackslash\}\}\}/g;
$tail =~ s/zum Grunde liegen\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}/zum Grunde liegen\.\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\} \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]/g;

$tail =~ s/\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}\\stoprdg\}\} \\noindentation Grammatik der/\\stoprdg\}\} \\noindentation Grammatik der/g;
$tail =~ s/derselben\\margin\{.{8}\}\{omClose\}\{.{8}\}\{\\tfx\\high\{c\\textbackslash\}\}\{c\\textbackslash\} besonders studieren/derselben\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{c\\textbackslash\}\}\{c\\textbackslash\} besonders studieren/g;
$tail =~ s/Halle 1804\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\{\\tfx\\high\{a\\textbackslash\}\}\\stopitemize \\stoprdg\}\} \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\{\\tfx\\high\{a\\textbackslash\}\}/Halle 1804\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\{\\tfx\\high\{a\\textbackslash\}\}\\stopitemize \\stoprdg\}\} \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]/g;
$tail =~ s/ndern\. \\crlf \\rightaligned\{A\. d\. H\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\} \{\\tfx\\high\{a\\textbackslash\}\}\}\\stopnarrow\}\\blank\[2pt\]\{\\tfx\\high\{a\\textbackslash\}\} /ndern\. \\crlf \\rightaligned\{A\. d\. H\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\} \{\\tfx\\high\{a\\textbackslash\}\}\}\\stopnarrow\}\\blank\[2pt\] /g;
$tail =~ s/sicht nehmen\. \\crlf \\rightaligned\{A\. d\. H\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\} \{\\tfx\\high\{a\\textbackslash\}\}\}\\stopnarrow\}\\blank\[2pt\]\{\\tfx\\high\{a\\textbackslash\}\}/sicht nehmen\. \\crlf \\rightaligned\{A\. d\. H\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\} \{\\tfx\\high\{a\\textbackslash\}\}\}\\stopnarrow\}\\blank\[2pt\]/g;
$tail =~ s/\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}\\subject\[241243\.\]/\\subject\[241243\.\]/g;
$tail =~ s/\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{c\\textbackslash\}\}\{c\\textbackslash\}\\subject\[ 261263260/\\subject\[ 261263260/g;
$tail =~ s/\\margin\{\}\{omOpen\}\{\}\{\\tfx\\high\{\/a\}\}\{\/a}\\writetolist\[section\]\{\}\{Vierter /\\writetolist\[section\]\{\}\{Vierter /g;
$tail =~ s/ne Wissenschaften\.\}\}\\blank\[2pt\]\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}/ne Wissenschaften\.\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}\}\}\\blank\[2pt\]/g;
$tail =~ s/D\. H\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}/D\. H\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/\{\[\\\}\]\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}\\par /\{\[\\\}\]\}\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/\\rightaligned\{A\. d\. H\.\\\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}/\\rightaligned\{A\. d\. H\.\\\}\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/\\rightaligned\{A\. d\. H\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}\}\\par/\\rightaligned\{A\. d\. H\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}/g;
$tail =~ s/\\rightaligned\{A\. d\. H\.\\\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}\}/\\rightaligned\{A\. d\. H\.\\\}\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{a\\textbackslash\}\}\{a\\textbackslash\}/g;
$tail =~ s/A\. d\. H\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\} \{\\tfx\\high\{a\\textbackslash\}\}\}/A\. d\. H\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\{\\tfx\\high\{a\\textbackslash\}\}/g;
$tail =~ s/A\. d\. H\.\{\[\\\}\]\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}/A\. d\. H\.\{\[\\\}\]\}\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/nne\.\\blank\[2pt\]\\stoprdg\}\}\\subject\[§\. 211214\.\]/nne\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\stoprdg\}\}\\subject\[§\. 211214\.\]/g;
#$tail =~ s/Halle 1781\. 8\.\\stopitemize/Halle 1781\. 8\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\stopitemize/g;
$tail =~ s/an die Hand geben\.\\par \\blank\[2pt\]\\stoprdg\}/an die Hand geben\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}/g;
$tail =~ s/20\. October 1818\. \\crlf \\rightaligned\{\\italic\{Der Herausgeber\.\}\}\\par/20\. October 1818\. \\crlf \\rightaligned\{\\italic\{Der Herausgeber\.\}\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/die Zukunft\. \\crlf \\rightaligned\{D\. H\.\}\\par \\blank\[2pt\]/die Zukunft\. \\crlf \\rightaligned\{D\. H\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/Halle, den 25\. April 1819\.\\par/Halle, den 25\. April 1819\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/besonders die 3te Sammlung, errinnern\.\\par \\blank\[2pt\]/besonders die 3te Sammlung, errinnern\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/\\rightaligned\{\\antIndex\{Cicero, Marcus Tullius\}\\italic\{Cic\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}/\\rightaligned\{\\antIndex\{Cicero, Marcus Tullius\}\\italic\{Cic\.\}\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/Halle 1781\. 8\.\\stopitemize \\blank\[2pt\]/Halle 1781\. 8\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\stopitemize \\stopnarrow\}/g;
#$tail =~ s/Halle 1781\. 8\./Halle 1781\. 8\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}/g;
$tail =~ s/\\stopnarrow\}\\stoprdg\}\}\\subject\[\§\. /\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\stopnarrow\}\\stoprdg\}\}\\subject\[\§\. /g;
$tail =~ s/D\. H\.\\\}\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}//g;


# paragraphs

$tail =~ s/im Jahr 1791\.\\par /im Jahr 1791\./g;
$tail =~ s/\\par \\stoprdg\}\} \\noindentation \\resetnumber/\\stoprdg\}\} \\resetnumber/g;
$tail =~ s/\\setuppagenumber\[number=1\]\\setuppagenumber\[number=25\]/\\setuppagenumber\[number=25\]/g;
$tail =~ s/1818\/19\}\} \\crlf \{\\switchtobodyfont\[8\.5pt\]\{\\startrdg\\noindentation/1818\/19\}\} \{\\switchtobodyfont\[8\.5pt\]\{\\startrdg/g;
$tail =~ s/\\noindentation \\par \\blank\[2pt\]//g;
$tail =~ s/diese\.\\par \\blank\[2pt\] \{\\switchtobodyfont\[8\.5pt\] \\startnarrow/diese\.\{\\switchtobodyfont\[8\.5pt\] \\startnarrow/g;
$tail =~ s/literarische Kenntnisse geben\. \\crlf/literarische Kenntnisse geben\./g;
$tail =~ s/Die neueste Zeit ist/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Die neueste Zeit ist/g;
$tail =~ s/In den Schriften,/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]In den Schriften,/g;
$tail =~ s/Man sollte daher auf/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Man sollte daher auf/g;
$tail =~ s/geworden ist\.\\par Inde/geworden ist\.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\] Inde/g;
$tail =~ s/Vielleicht kommt/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Vielleicht kommt/g;
$tail =~ s/des Verfassers unterschieden worden\.\\par/des Verfassers unterschieden worden\.\\par\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/g;
$tail =~ s/Oft habe ich bei der/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Oft habe ich bei der/g;
$tail =~ s/Halle, den 25\. April/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Halle, den 25\. April/g;
$tail =~ s/Literatur\.\\par Fast/Literatur\.\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Fast/g;
$tail =~ s/zum Grunde gelegt habe\.\\par/zum Grunde gelegt habe\.\\par\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]/g;
$tail =~ s/Die Erscheinung der/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Die Erscheinung der/g;
$tail =~ s/Gleichwohl hat man/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Gleichwohl hat man/g;
$tail =~ s/Man that/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Man that/g;
$tail =~ s/ssig seyn\.\\par/ssig seyn\.\\par\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Man that/g;
$tail =~ s/des Werks zusammen\. /des Werks zusammen\. \\blank\[2pt\]/g;
#$tail =~ s/joinedup, inmargin\]\\blank\[12pt\]\\tablemainheadrdg\[Vierter Theil\.\]/joinedup, inmargin\]\\tablemainheadrdg\[Vierter Theil\.\]/g;
$tail =~ s/Ansichten des Verfassers des Werks zusammen\. \\blank\[2pt\]/Ansichten des Verfassers des Werks zusammen\. \\blank\[4pt\]/g;
$tail =~ s/ndet\.\\par \\blank\[2pt\] \{\\switchtobodyfont\[8\.5pt\] \\startnarrow \{\\dvl\}/ndet\. \\noindentation \\blank\[2pt\] \{\\switchtobodyfont\[8\.5pt\] \\startnarrow \{\\dvl\}/g;
$tail =~ s/Isidorus\. Halle 1778\.\\sym\{\}/Isidorus\. Halle 1778\.\\\\\\sym\{\}/g;


# errors dealing with the commentary + margins

$tail =~ s/\\par \\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[([\w\d]{7})\]Es war/\\par Es \\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[$1\]war/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e8440\]//g;
$tail =~ s/\{\\tfx\\high\{\/c\}\}\\sachIndex\{Wissen\}Wissen/\{\\tfx\\high\{\/c\}\}\\sachIndex\{Wissen\}Wissen\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e8440\]/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e20290\]//g;
$tail =~ s/\\sachIndex\{Person\}\\italic\{Person\}, als Suppositum/\\sachIndex\{Person\}\\italic\{Person\}, \\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e20290\]als Suppositum/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e29961\]//g;
$tail =~ s/ mit sich bringt\.\\par \\blank\[2pt\] \{\\switchtobodyfont\[8\.5pt\] \\startnarrow \\persIndex\{Adelung, Johann Christoph\}\\italic\{Adelungs\}\\cNote\{\\italic\{Adelung's\}\} Magazin/ mit sich bringt\. \{\\switchtobodyfont\[8\.5pt\] \\startnarrow \\persIndex\{Adelung, Johann Christoph\}\\italic\{Adelungs\}\\cNote\{\\italic\{Adelung's\}\} Magazin\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e29961\]/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e160171\]//g;
$tail =~ s/Zu \\italic\{literarischen\} Berichtigungen/\\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\]Zu \\italic\{literarischen\} Berichtigungen\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e160171\]/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e63308\]//g;
$tail =~ s/ber die Evidenz in metaphysichen Wissenschaften, von \\/ber die\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e63308\] Evidenz in metaphysichen Wissenschaften, von \\/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e179251\]//g;
$tail =~ s/Katechetische Magazine haben \\/Katechetische\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e179251\] Magazine haben \\/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e109434\]//g;
$tail =~ s/\\par Was man neuerlich/\\par \\starteffect\[hidden\]\. \\stopeffect \\hspace\[p\] Was man \\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e109434\]neuerlich/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e89646\]//g;
$tail =~ s/\\par Die Leser erhalten/\\par Die Leser erhalten\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e89646\]/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e72220\]//g;
$tail =~ s/\\par Zu \\italic\{literarischen\} Berichtigungen/\\par Zu \\italic\{literarischen\} Berichtigungen\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e72220\]/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e100658\]//g;
$tail =~ s/\\par Die im Jahr 1818\./\\par Die im Jahr 1818\.\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e100658\]/g;



# errors dealing with the commentary + scribal abbreviations
$tail =~ s/1818\. \\crlf \\crlf \\rightaligned\{Der Herausgeber\.\}\\par \\stoprdg\}\}/1818\. \\crlf \\crlf \\rightaligned\{Der Herausgeber\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}/g;
$tail =~ s/285\.\\stopitemize \\stopitemize \\stoprdg\}\}/285\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stopitemize \\stopitemize \\stoprdg\}\}/g;
$tail =~ s/statt Theil\.\\stopitemize \\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{c\\textbackslash\}\}\{c\\textbackslash\}\{\\tfx\\high\{a\\textbackslash\}\}/statt Theil\.\\margin\{\}\{omClose\}\{\}\{\\tfx\\high\{c\\textbackslash\}\}\{c\\textbackslash\}\{\\tfx\\high\{a\\textbackslash\}\}\\stopitemize /g;
$tail =~ s/\\rightaligned\{A\. d\. H\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}/\\rightaligned\{A\. d\. H\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e188609\]//g;
$tail =~ s/ Die im Jahr 1818/ Die im\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e188609\] Jahr 1818/g;

# manual indentation of notes
$tail =~ s/\\italic\{Anm\.\} 1\. Die Zweydeutigkeit, die in den/\{\\startnarrow\\italic\{Anm\.\} 1\. Die Zweydeutigkeit, die in den/g;
$tail =~ s/tigen\.\\blank\[2pt\] \\subject\[ 173\.\]/tigen\.\\stopnarrow\}\\blank\[2pt\] \\subject\[ 173\.\]/g;
$tail =~ s/Zwar sollte diese Instrumentalphilosophie/\{\\startnarrow Zwar sollte diese Instrumentalphilosophie/g;
$tail =~ s/zur Grundlage dient\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}/zur Grundlage dient\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\stopnarrow\}/g;
$tail =~ s/Zweifel gesetzt werden sollen\.\\par \\blank\[2pt\]/Zweifel gesetzt werden sollen\.\\par \\blank\[2pt\]\{\\startnarrow /g;
$tail =~ s/\\sachIndex\{moralisch\}\\italic\{Moralisch\} nennt man bey/\{\\startnarrow\\sachIndex\{moralisch\}\\italic\{Moralisch\} nennt man bey/g;
$tail =~ s/aus der Natur erkennbar ist\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\blank\[2pt\]/aus der Natur erkennbar ist\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\stopnarrow\}/g;
$tail =~ s/\\blank\[2pt\]Zu dieser letztern Art/\{\\startnarrow Zu dieser letztern Art/g;
$tail =~ s/zu erkennen\?\\blank\[2pt\]/zu erkennen\?\\stopnarrow\}/g;
$tail =~ s/\\blank\[2pt\]Auf dieses letzte/\{\\startnarrow Auf dieses letzte/g;
$tail =~ s/rden\.\\blank\[2pt\] \\subject\[ 208\.\]/rden\.\\stopnarrow\} \\subject\[ 208\.\]/g;
$tail =~ s/tte\.\\par \\blank\[2pt\]\*\) S\./tte\.\\par {\\startnarrow\*\) S\./g;
$tail =~ s/S\. 154 f\.\\blank\[2pt\] \\subject\[209/S\. 154 f\.\\stopnarrow\} \\subject\[209/g;
$tail =~ s/\\blank\[2pt\]Man hat oft darauf gedrungen/\{\\startnarrow Man hat oft darauf gedrungen/g;
$tail =~ s/keine Anwendung litte\.\\blank\[2pt\]/keine Anwendung litte\.\\stopnarrow\}/g;
$tail =~ s/\\blank\[2pt\]Um sich von der Richtigkeit dieser/\{\\startnarrow Um sich von der Richtigkeit dieser/g;
$tail =~ s/wahr sind\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\blank\[2pt\]/wahr sind\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\\stopnarrow\}/g;
$tail =~ s/unbeantwortlich sey\. \*\)\\par \\blank\[2pt\]/unbeantwortlich sey\. \*\)\\par \{\\startnarrow/g;
$tail =~ s/nne\.\\blank\[2pt\]\\stoprdg\}\}\\subject/nne\.\\stopnarrow\}\\stoprdg\}\}\\subject/g;


# general font problems

$tail =~ s/Vorrede des Herausgebers \(c\)\]\{\{\\margin\{\}\{plOpen\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}/Vorrede des Herausgebers \(c\)\]\{\{\\margin\{\}\{plOpen\}\{\}\{\\tfxx\\high\{c\}\}\{c\}\}/g;
$tail =~ s/\\tableheadrdg\[ Innhalt des ganzen/\\tablehead\[ Innhalt des ganzen/g;
$tail =~ s/ganzen Buchs\}\}\}\\sym\{\} \\setupindenting\[yes,medium\] \\setupitemgroup\[itemize\]\[indenting=\{40pt,next\}\] \\startitemize\[packed, paragraph, joinedup, inmargin\]\\tableheadrdg/ganzen Buchs\}\}\}\\sym\{\} \\setupindenting\[yes,medium\] \\setupitemgroup\[itemize\]\[indenting=\{40pt,next\}\] \\startitemize\[packed, paragraph, joinedup, inmargin\]\\tablehead/g;
$tail =~ s/\\subject\[207\.\]\{\{207\.\}\}\\blank\[2pt\]Man/\\subject\[207\.\]\{\{\\switchtobodyfont\[8pt\]\{207\.\}\}\}\\blank\[2pt\]Man/g;
$tail =~ s/\\subject\[ 208\.\]\{\{\\margin\{\}\{pb\}\{\}\{\\vl\}\{a197\} 208\.\}\}/\\subject\[ 208\.\]\{\{\\margin\{\}\{pb\}\{\}\{\\vl\}\{a197\} \{\\switchtobodyfont\[8pt\]208\.\}\}\}/g;
$tail =~ s/\\subject\[209\.\]\{\{209\.\}\}\\blank\[2pt\]So/\\subject\[209\.\]\{\{\{\\switchtobodyfont\[8pt\]209\.\}\}\}\\blank\[2pt\]So/g;
$tail =~ s/\\subject\[210\.\]\{\{210\.\}\}\\blank\[2pt\]Die/\\subject\[210\.\]\{\{\{\\switchtobodyfont\[8pt\]210\.\}\}\}\\blank\[2pt\]Die/g;
$tail =~ s/\\subject\[211\.\]\{\{211\.\}\}\\blank\[2pt\]Und/\\subject\[211\.\]\{\{\{\\switchtobodyfont\[8pt\]211\.\}\}\}\\blank\[2pt\]Und/g;
$tail =~ s/\\subject\[202\.\]\{\{202\.\}\}\\blank/\\subject\[202\.\]\{\{\\switchtobodyfont\[8pt\] 202\.\}\}\\blank/g;
$tail =~ s/\\subject\[195\.\]\{\{195\.\}\}\\blank/\\subject\[195\.\]\{\{\\switchtobodyfont\[8pt\] 195\.\}\}\\blank/g;
$tail =~ s/\\subject\[196\.\]\{\{196\.\}\}\\blank/\\subject\[196\.\]\{\{\\switchtobodyfont\[8pt\] 196\.\}\}\\blank/g;
$tail =~ s/\\subject\[178\.\]\{\{178\.\}\}\\blank/\\subject\[178\.\]\{\{\\switchtobodyfont\[8pt\] 178\.\}\}\\blank/g;
$tail =~ s/\\subject\[179\.\]\{\{179\.\}\}\\blank/\\subject\[179\.\]\{\{\\switchtobodyfont\[8pt\] 179\.\}\}\\blank/g;
$tail =~ s/tigen\.\\stopnarrow\}\\blank\[2pt\] \\subject\[173\.\]\{\{173\.\}\}\\blank/tigen\.\\stopnarrow\}\\blank\[2pt\] \\subject\[173\.\]\{\{\\switchtobodyfont\[8pt\] 173\.\}\}\\blank/g;
$tail =~ s/\\tablehead\[Zweyter Theil\.\]\{\{Zweyter Theil\.\}\}\\tableheadrdg/\\tableheadrdg\[Zweyter Theil\.\]\{\{Zweyter Theil\.\}\}\\tableheadrdg/g;
$tail =~ s/\\tablehead\[ Dritter Theil\.\]\{\{\\margin\{\}\{pb\}\{\}\{\\vl\}\{a\[X\]\} Dritter Theil\.\}\}\\tableheadrdg/\\tableheadrdg\[ Dritter Theil\.\]\{\{\\margin\{\}\{pb\}\{\}\{\\vl\}\{a\[X\]\} Dritter Theil\.\}\}\\tableheadrdg/g;
$tail =~ s/\\marking\[oddHeader\]\{III\. Inhalt des dritten Theils \(c\)\}\}\}\\subject/\\marking\[oddHeader\]\{III\. Inhalt des dritten Theils \(c\)\}\}\}\\tableheadrdg/g;
$tail =~ s/90\.\\stopitemize \\stopitemize \\stopitemize \\subject\[ Vierter Theil\./90\.\\stopitemize \\stopitemize \\stopitemize \\page \\tableheadrdg\[ Vierter Theil\./g;
$tail =~ s/cIX\} Vierter Theil\.\}\}\\subject\[Von/cIX\} Vierter Theil\.\}\}\\tableheadrdg\[Von/g;
$tail =~ s/zweiten Theils \(c\)\}\}\}\\subject\[Von den eigentlichen theologischen Wissenschaften\.\]\{\{Von den eigentlichen theologischen Wissenschaften\.\}\}\\blank\[2pt\]/zweiten Theils \(c\)\}\}\}\\tableheadrdg\[Von den eigentlichen theologischen Wissenschaften\.\]\{\{Von den eigentlichen theologischen Wissenschaften\.\}\}\\blank\[2pt\]/g;
$tail =~ s/\{a164\} 173\.\}/\{a164\} \{\\switchtobodyfont\[8pt\]173\.\}\}/g;


# pagebreaks
$tail =~ s/thig sey\\cNote\{sei\}\.\\par \\blank\[2pt\]\\marking/thig sey\\cNote\{sei\}\.\\page\[empty,right\]\\marking/g;

# hyphenation
$tail =~ s/1832\) sind 1798/ 1832\) sind 1798/g;
$tail =~ s/gemeinschaftlicher Wiederholung/gemeinschaft-\\\\licher Wiederholung/g;
$tail =~ s/Theile \\margin\{\}\{omOpen\}\{\}\{\\tfx\\high\{\/c\}\}\{\/c\}derselben/Theile \\margin\{\}\{omOpen\}\{\}\{\\tfx\\high\{\/c\}\}\{\/c\}dersel-\\\\ben/g;
$tail =~ s/Kirchengeschichte, mehr als/Kirchen-\\\\geschichte, mehr als/g;
#$tail =~ s/\{\\tfx\\high\{\/c\}\}\{\\tfx\\high\{\/a\}\}suchen\;/\{\\tfx\\high\{\/c\}\}\{\\tfx\\high\{\/a\}\}su\\\\chen\;/g;


# alignment
$tail =~ s/\\margin\{\}\{pb\}\{\}\{\\vl\}\{b\[II\]\}\{\\tfx\\high\{ac\\textbackslash\}\}/\\leftaligned\{\\margin\{\}\{pb\}\{\}\{\\vl\}\{b\[II\]\}\{\\tfx\\high\{ac\\textbackslash\}\}\}/g;
$tail =~ s/\\switchtobodyfont\[8\.5pt\]\\margin\{\}\{plOpen\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\marking\[oddHeader\]\{Vorreden\}\{\\startalignment\[center\]\\margin\{\}\{pb\}\{\}\{\\vl\}\{c\[I\]\} Anweisung /\\switchtobodyfont\[8\.5pt\]\{\\startalignment\[center\]\\margin\{\}\{plOpen\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\margin\{\}\{pb\}\{\}\{\\vl\}\{c\[I\]\} Anweisung /g;
$tail =~ s/Wittwe\. 1791\.\\stopalignment\}\\margin\{\}\{pb\}\{\}\{\\vl\}\{b\[2\]\}\{\\tfx\\high\{ac\\textbackslash\}\} \\crlf/Wittwe\. 1791\.\\stopalignment\}\\leftaligned\{\\margin\{\}\{pb\}\{\}\{\\vl\}\{b\[2\]\}\{\\tfx\\high\{ac\\textbackslash\}\}\}/g;
$tail =~ s/\\stopalignment\}\\margin\{\}\{pb\}\{\}\{\\vl\}\{c\[II\]\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\} \\crlf/\\stopalignment\}\\leftaligned\{\\margin\{\}\{pb\}\{\}\{\\vl\}\{c\[II\]\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\}\}/g;
$tail =~ s/\\stopalignment\}\\margin\{\}\{pb\}\{\}\{\\vl\}\{a\[II\]\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\} \\par \\blank\[2pt\]\}/\\stopalignment\}\\leftaligned\{\\margin\{\}\{pb\}\{\}\{\\vl\}\{a\[II\]\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{a\}\}\{a\}\}\}/g;


# orphan and widow lines
$tail =~ s/93\.\\page\\sym\{\}\\italic\{Erster Abschnitt\:/93\.\\sym\{\}\\italic\{Erster Abschnitt\:/g;
$tail =~ s/287\.\\stopitemize \\stopitemize \\sym\{\}/287\.\\stopitemize \\stopitemize \\sym\{\}\\page/g;
$tail =~ s/Zuletzt, von der vor dem Studium/Zuletzt, von\\page \\noindentation der vor dem Studium/g;
$tail =~ s/\\stopitemize \\stopitemize \\stopitemize \\sym\{\}\\italic\{Zweyter Abschnitt\: Philosophie\.\}/\\stopitemize \\stopitemize \\stopitemize \\page\\sym\{\}\\italic\{Zweyter Abschnitt\: Philosophie\.\}/g;
$tail =~ s/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e99376\]Verfassers Anweisung zur theologischen/\\margin\{\}\{e\}\{\}\{\\hbox\{\}\}\{E\}\\pagereference\[d1e99376\]Verfassers Anweisung zur theo-\\page logischen/g;
$tail =~ s/\\sym\{\} \\setupindenting\[yes, medium\] \\setupitemgroup\[itemize\]\[indenting=\{40pt, next\}\] \\startitemize\[packed, paragraph, joinedup, inmargin\]\\blank\[4pt\]\\tablehead\[Vierter Theil\.\]/\\page\\sym\{\} \\setupindenting\[yes, medium\] \\setupitemgroup\[itemize\]\[indenting=\{40pt, next\}\] \\startitemize\[packed, paragraph, joinedup, inmargin\]\\blank\[4pt\]\\tablehead\[Vierter Theil\.\]/g;



# page breaks in margins

$tail =~ s/a235\}/\; a235\}/g;
$tail =~ s/c254\} \\line\{\}/c254\]\} \\line\{\}/g;
$tail =~ s/c\[3\]\} Zweyter/c\[3\]\]\} Zweyter/g;
$tail =~ s/a709\} \\margin/\; a709\}\\margin/g;


# corrigenda
$tail =~ s/sq\.\)\\NC sq\.\\NC \\NR \\NC ac/sq\.\)\\NC sq\.\\NC \\NR \\NC a448, c157/g;
$tail =~ s/theologischen\\NC \\NR \\NC ac/theologischen\\NC \\NR \\NC a576, c269/g;

# empty pages. check this!
$tail =~ s/zu unterrichten\.\\stopitemize \\par \\blank\[2pt\]\\page\[right, empty\]/zu unterrichten\.\\stopitemize\\page\[empty\]/g;
$tail =~ s/errinnern\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}\\page\[right, empty\]/errinnern\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}\\page\[empty\]/g;
$tail =~ s/an die Hand geben\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}\\page\[right, empty\]/an die Hand geben\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}\\page\[empty\]/g;
$tail =~ s/diesen Lehren ist\}\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\page\[right, empty\]/diesen Lehren ist\}\.\\stopnarrow\}\\page\[empty\]/g;
$tail =~ s/Vernunft hinneigen mag\.\\par \\blank\[2pt\]\\stoprdg\}\}\\page\[right, empty\]/Vernunft hinneigen mag\.\\stoprdg\}\}\\page\[empty\]/g;

$tail =~ s/\\setuppagenumber\[number=25\]\\page\[right, empty\]/\\setuppagenumber\[number=25\]\\page\[empty\]/g;
$tail =~ s/gehandelt werden\}\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\page\[right, empty\]/gehandelt werden\}\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\page\[empty\]/g;
$tail =~ s/1811\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}\\stopitemize \\par \\blank\[2pt\]\\page\[right, empty\]/1811\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}\\stopitemize \\par \\blank\[2pt\]\\page\[empty\]/g;
$tail =~ s/1741\. 8\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stopnarrow\}\\blank\[2pt\]\\page\[right, empty\]/1741\. 8\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stopnarrow\}\\blank\[2pt\]\\page\[empty\]/g;
$tail =~ s/Geschichte d\. Philos\. Leipz\. 1812\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\\stopitemize \\stoprdg\}\}\\par \\blank\[2pt\]\\page\[right, empty\]/Geschichte d\. Philos\. Leipz\. 1812\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\\stopitemize \\stoprdg\}\}\\par \\blank\[2pt\]\\page\[empty\]/g;
$tail =~ s/geliefert hat\}\.\\par \\blank\[2pt\] \\page\[right, empty\]/geliefert hat\}\.\\par \\blank\[2pt\] \\page\[empty\]/g;
$tail =~ s/Br\. 23\. 24\. \\crlf \\rightaligned\{A\. d\. H\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\} \\stopnarrow\}\\blank\[2pt\]/Br\. 23\. 24\. \\crlf \\rightaligned\{A\. d\. H\.\}\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\} \\stopnarrow\}\\page\[right, empty\]/g;
$tail =~ s/Nothwendigkeit 215\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\\stopitemize \\stopitemize \\stoprdg\}\}\\page\[right, empty\]/Nothwendigkeit 215\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\~\\stopitemize \\stopitemize \\stoprdg\}\}\\page/g;
$tail =~ s/ssen\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\page\[right, empty\]/ssen\. \\stopnarrow\}\\page\[empty\]/g;
$tail =~ s/hrt\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\page\[right, empty\]/hrt\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\page\[empty\]/g;
$tail =~ s/Sammlung, errinnern\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}\\page\[empty\]/Sammlung, errinnern\.\\margin\{\}\{plClose\}\{\}\{\\tfx\\high\{c\}\}\{c\}\\stoprdg\}\}\\page\[right, empty\]/g;
$tail =~ s/besonders darauf leiten\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\page\[right, empty\]/besonders darauf leiten\. \\stopnarrow\} \\blank\[2pt\] \\blank\[2pt\]\\page\[empty\]/g;
$tail =~ s/\\page\[right, empty\]\\noheaderandfooterlines\\writetolist\[section\]\{\}\{Zweyter Abschnitt\. \\italic\{Allgemeinere/\\page\[empty\]\\noheaderandfooterlines\\writetolist\[section\]\{\}\{Zweyter Abschnitt\. \\italic\{Allgemeinere/g;
$tail =~ s/geliefert hat\}\.\\par \\blank\[2pt\] \\page\[empty\]\\noheaderandfooterlines\\writetolist\[section\]\{\}\{Vierter Abschnitt/geliefert hat\}\.\\noheaderandfooterlines\\writetolist\[section\]\{\}\{Vierter Abschnitt/g;


# error in biblical index

$tail =~ s/\\bibelIndex\{([\w]+)\+\}//g;


$head = $head . $tail;
print $head;