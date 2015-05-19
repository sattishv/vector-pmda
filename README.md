Generic PMDA
============

This PMDA is a sample that illustrates how a simple PMDA might be
constructed using libpcp_pmda.

Although the metrics supported as simple, the framework is quite
general, and could be extended to implement a much more complex PMDA.

Note:
	This PMDA may be remade from source and hence requires IDO (or
	more specifically a C compiler) to be installed.

	Uses of make(1) may fail (without removing or clobbering files)
	if the C compiler cannot be found.  This is most likely to
	happen when running the PMDA ./Install script.

	The only remedial action is to install the C compiler, or
	hand-craft changes to the Makefile.

Metrics
=======

The file ./help contains descriptions for all of the metrics exported
by this PMDA.

Once the PMDA has been installed, the following command will list all
the available metrics and their explanatory "help" text:

	$ pminfo -fT generic

Installation
============

 +  # cd $PCP_PMDAS_DIR/generic

 +  Check that there is no clash in the Performance Metrics Domain
    defined in ./domain.h and the other PMDAs currently in use (see
    $PCP_PMCDCONF_PATH).  If there is, edit ./domain.h to choose another
    domain number.

 +  Then simply use

	# ./Install

    and choose both the "collector" and "monitor" installation
    configuration options -- everything else is automated.

De-installation
===============

 +  Simply use

        # cd $PCP_PMDAS_DIR/generic
	# ./Remove

Troubleshooting
===============

 +  After installing or restarting the agent, the PMCD log file
    ($PCP_LOG_DIR/pmcd/pmcd.log) and the PMDA log file
    ($PCP_LOG_DIR/pmcd/generic.log) should be checked for any warnings
    or errors.
