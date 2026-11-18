<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$php = PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Welcome to CodeIgniter 3</title>
	<style type="text/css">
	::selection { background-color: #E13300; color: white; }

	body {
		margin: 0;
		background: #f2f2f2 repeating-linear-gradient(45deg, #f2f2f2 0, #f2f2f2 10px, #ececec 10px, #ececec 20px);
		font: 13px/20px Verdana, Geneva, Tahoma, sans-serif;
		color: #4F5155;
	}

	a { color: #003399; text-decoration: none; }
	a:hover { color: #97310e; text-decoration: underline; }

	#container {
		max-width: 760px;
		margin: 40px auto;
		background: #fff;
		border: 1px solid #D0D0D0;
		box-shadow: 0 0 8px #D0D0D0;
	}

	#masthead {
		padding: 22px 24px 18px;
		color: #fff;
		background: linear-gradient(#f26b38, #dd4814 55%, #c13a0c);
		border-bottom: 3px solid #97310e;
		text-shadow: 0 1px 0 rgba(0, 0, 0, .35);
	}

	#masthead h1 {
		margin: 0;
		font: bold 26px/32px "Trebuchet MS", Verdana, sans-serif;
	}

	#masthead p { margin: 6px 0 0; font-size: 12px; opacity: .95; }

	.flame { font-size: 30px; margin-right: 6px; }

	#body { padding: 18px 24px 6px; }

	h2 {
		color: #444;
		font: bold 15px/20px "Trebuchet MS", Verdana, sans-serif;
		border-bottom: 1px solid #D0D0D0;
		padding-bottom: 6px;
		margin: 18px 0 10px;
	}

	.badge {
		display: inline-block;
		padding: 2px 8px;
		margin: 0 4px 6px 0;
		border: 1px solid #c13a0c;
		border-radius: 3px;
		background: linear-gradient(#fff, #fbe3d8);
		color: #97310e;
		font-size: 11px;
		font-weight: bold;
	}

	.badge.ok { border-color: #3c8d2f; background: linear-gradient(#fff, #def3d6); color: #2b6a20; }

	table.timeline { width: 100%; border-collapse: collapse; }
	table.timeline td { padding: 6px 8px; border-bottom: 1px dotted #D0D0D0; vertical-align: top; }
	table.timeline td.year { width: 64px; color: #dd4814; font-weight: bold; }

	code {
		font-family: Consolas, Monaco, "Courier New", Courier, monospace;
		font-size: 12px;
		background-color: #f9f9f9;
		border: 1px solid #D0D0D0;
		color: #002166;
		display: block;
		margin: 10px 0;
		padding: 10px;
	}

	.note {
		background: #fffbe6;
		border: 1px solid #f0d97a;
		padding: 8px 10px;
		font-size: 12px;
	}

	p.footer {
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 24px;
		margin: 20px 0 0;
		background: #fafafa;
	}
	</style>
</head>
<body>

<div id="container">
	<div id="masthead">
		<h1><span class="flame">&#128293;</span>Welcome to CodeIgniter!</h1>
		<p>A CodeIgniter 3 application, still running in <?php echo date('Y'); ?>. Deployed by dPanel.</p>
	</div>

	<div id="body">
		<p>
			<span class="badge">CodeIgniter <?php echo CI_VERSION; ?></span>
			<span class="badge">PHP <?php echo $php; ?></span>
			<span class="badge">FrankenPHP</span>
			<span class="badge ok">Status: OK</span>
		</p>

		<p>The page you are looking at is being generated dynamically by CodeIgniter, the same way it was in the early 2010s: one controller, one view, no build step.</p>

		<h2>A short history</h2>
		<table class="timeline">
			<tr><td class="year">2006</td><td>CodeIgniter 1.0, the first public release, by EllisLab.</td></tr>
			<tr><td class="year">2011</td><td>CodeIgniter 2.0: PHP 4 support dropped.</td></tr>
			<tr><td class="year">2014</td><td>EllisLab hands the framework to the British Columbia Institute of Technology.</td></tr>
			<tr><td class="year">2015</td><td>CodeIgniter 3.0 released.</td></tr>
			<tr><td class="year">2022</td><td>CodeIgniter 3.1.13, the last 3.x release so far.</td></tr>
			<tr><td class="year">Today</td><td>CodeIgniter 4 is the current version. CodeIgniter 3 is the legacy line, in maintenance.</td></tr>
		</table>

		<h2>Where things are</h2>
		<p>This page is a view:</p>
		<code>application/views/welcome_message.php</code>
		<p>and its controller is:</p>
		<code>application/controllers/Welcome.php</code>
		<p>Other pages: <a href="<?php echo site_url('blog'); ?>">blog</a> &middot; <a href="<?php echo site_url('health'); ?>">health check</a></p>

		<p class="note">CodeIgniter 3 is legacy. This repository keeps it running on current PHP so an old codebase can live on a modern server while you plan the move to CodeIgniter 4.</p>
	</div>

	<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds using <strong>{memory_usage}</strong>.</p>
</div>

</body>
</html>
