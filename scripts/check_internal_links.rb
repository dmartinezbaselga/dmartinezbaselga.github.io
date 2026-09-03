#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"
require "yaml"

site_dir = Pathname(ARGV.fetch(0, "_site")).expand_path
abort "Site directory not found: #{site_dir}" unless site_dir.directory?

config = YAML.safe_load_file("_config.yml", aliases: true)
baseurl = config.fetch("baseurl", "").to_s.sub(%r{/$}, "")
site_url = config.fetch("url", "").to_s.sub(%r{/$}, "")
missing = []

site_dir.glob("**/*.html").each do |html_file|
  html = html_file.read
  html.scan(/(?:href|src)=["']([^"']+)["']/i).flatten.each do |raw_link|
    next if raw_link.empty? || raw_link.start_with?("#", "mailto:", "tel:", "data:", "javascript:")

    raw_link = raw_link.delete_prefix(site_url) if !site_url.empty? && raw_link.start_with?(site_url)
    next if raw_link.match?(%r{^[a-z][a-z0-9+.-]*://}i) || raw_link.start_with?("//")

    link = raw_link.split(/[?#]/, 2).first
    next if link.nil? || link.empty?

    if link.start_with?("/")
      if !baseurl.empty? && (link == baseurl || link.start_with?("#{baseurl}/"))
        link = link.delete_prefix(baseurl)
      end
      target = site_dir.join(link.delete_prefix("/"))
    else
      target = html_file.dirname.join(link).cleanpath
    end

    candidates = [target]
    candidates << target.join("index.html") if target.directory? || File.extname(target.to_s).empty?
    candidates << Pathname("#{target}.html") if File.extname(target.to_s).empty?
    next if candidates.any?(&:exist?)

    missing << "#{html_file.relative_path_from(site_dir)} -> #{raw_link}"
  end
end

if missing.empty?
  puts "Internal link check passed."
else
  warn "Broken internal links:"
  missing.uniq.sort.each { |entry| warn "  #{entry}" }
  exit 1
end
